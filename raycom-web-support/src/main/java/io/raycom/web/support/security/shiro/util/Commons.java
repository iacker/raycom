/*
 * Copyright 2017-2018 the original author(https://github.com/wj596)
 * 
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * </p>
 */
package io.raycom.web.support.security.shiro.util;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.CompressionCodec;
import io.jsonwebtoken.CompressionCodecResolver;
import io.jsonwebtoken.CompressionCodecs;
import io.jsonwebtoken.Header;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.DefaultHeader;
import io.jsonwebtoken.impl.DefaultJwsHeader;
import io.jsonwebtoken.impl.TextCodec;
import io.jsonwebtoken.impl.compression.DefaultCompressionCodecResolver;
import io.jsonwebtoken.lang.Assert;
import io.raycom.common.cache.CacheUtils;
import io.raycom.web.support.utils.user.UserUtils;

/**
 * 辅助工具类
 * 
 * @author wangjie (https://github.com/wj596)
 * @date 2016年6月31日
 *
 */
public  class Commons {

	private static final Logger LOGGER = LoggerFactory.getLogger(Commons.class);
	
	// HMAC 加密算法名称
	public static final String HMAC_MD5 = "HmacMD5";// 128位
	public static final String HMAC_SHA1 = "HmacSHA1";// 126
	public static final String HMAC_SHA256 = "HmacSHA256";// 256
	public static final String HMAC_SHA512 = "HmacSHA512";// 512
	
	/**
	 * JWT签发令牌
	 * 
	 * @param id 令牌ID
	 * @param subject 用户ID
	 * @param issuer 签发人
	 * @param period 有效时间(毫秒)
	 * @param roles 访问主张-角色
	 * @param permissions 访问主张-权限
	 * @param algorithm 加密算法(SignatureAlgorithm是enum)
	 * @return json web token 
	 */
	public static String createJwt(String jwtSecretKey
								  ,String subject,String issuer,Long period,String roles
								  ,String permissions,SignatureAlgorithm algorithm) {

		// 当前时间戳(精确到毫秒)
		long currentTimeMillis = System.currentTimeMillis();
		// 秘钥
		byte[] secretKeyBytes = DatatypeConverter.parseBase64Binary(jwtSecretKey);
		JwtBuilder jwt  =  Jwts.builder();
		jwt.setId(UUID.randomUUID().toString());
		// 用户名
		jwt.setSubject(subject);
		// 签发者
		if(null!=issuer&&!"".equals(issuer)) jwt.setIssuer(issuer);
		// 签发时间
		jwt.setIssuedAt(new Date(currentTimeMillis));
		// 有效时间
		if(null != period){
			Date expiration = new Date(currentTimeMillis+period);
			jwt.setExpiration(expiration);
		}
		// 访问主张-角色
		if(null!=roles&&!"".equals(roles)) jwt.claim("roles", roles);
		// 访问主张-权限
		if(null!=permissions&&!"".equals(permissions)) jwt.claim("perms", permissions);
		jwt.compressWith(CompressionCodecs.DEFLATE);
		jwt.signWith(algorithm, secretKeyBytes);
		return jwt.compact();
	}
	

	private static final ObjectMapper MAPPER = new ObjectMapper(); 
	private static CompressionCodecResolver CODECRESOLVER = new DefaultCompressionCodecResolver();
	
	/**
	 * 判断是否AJAX请求
	 */
	public static boolean isAjax(HttpServletRequest request) {
		return "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
	}
	/**
	 * 判断是否AJAX请求
	 */
	public static String getJwt() {
		//生成jwt，放入cache中，并在全局cache中存儲token
		String jwt = UUID.randomUUID().toString();
		UserUtils.putCache("jwt", jwt);
		CacheUtils.put("tokenCache",jwt, UserUtils.getSession().getId());
		return jwt;
	}

	/**
	 * 解析JWT的Payload
	 */
	public static String parseJwtPayload(String jwt){
        Assert.hasText(jwt, "JWT String argument cannot be null or empty.");
        String base64UrlEncodedHeader = null;
        String base64UrlEncodedPayload = null;
        String base64UrlEncodedDigest = null;
        int delimiterCount = 0;
        StringBuilder sb = new StringBuilder(128);
        for (char c : jwt.toCharArray()) {
            if (c == '.') {
                CharSequence tokenSeq = io.jsonwebtoken.lang.Strings.clean(sb);
                String token = tokenSeq!=null?tokenSeq.toString():null;

                if (delimiterCount == 0) {
                    base64UrlEncodedHeader = token;
                } else if (delimiterCount == 1) {
                    base64UrlEncodedPayload = token;
                }

                delimiterCount++;
                sb.setLength(0);
            } else {
                sb.append(c);
            }
        }
        if (delimiterCount != 2) {
            String msg = "JWT strings must contain exactly 2 period characters. Found: " + delimiterCount;
            throw new MalformedJwtException(msg);
        }
        if (sb.length() > 0) {
            base64UrlEncodedDigest = sb.toString();
        }
        if (base64UrlEncodedPayload == null) {
            throw new MalformedJwtException("JWT string '" + jwt + "' is missing a body/payload.");
        }
        // =============== Header =================
        Header header = null;
        CompressionCodec compressionCodec = null;
        if (base64UrlEncodedHeader != null) {
            String origValue = TextCodec.BASE64URL.decodeToString(base64UrlEncodedHeader);
            Map<String, Object> m = readValue(origValue);
            if (base64UrlEncodedDigest != null) {
                header = new DefaultJwsHeader(m);
            } else {
                header = new DefaultHeader(m);
            }
            compressionCodec = CODECRESOLVER.resolveCompressionCodec(header);
        }
        // =============== Body =================
        String payload;
        if (compressionCodec != null) {
            byte[] decompressed = compressionCodec.decompress(TextCodec.BASE64URL.decode(base64UrlEncodedPayload));
            payload = new String(decompressed, io.jsonwebtoken.lang.Strings.UTF_8);
        } else {
            payload = TextCodec.BASE64URL.decodeToString(base64UrlEncodedPayload);
        }
        return payload;
    }
	
	public static Map<String, Object> readValue(String val) {
	     try {
	            return MAPPER.readValue(val, Map.class);
	     } catch (IOException e) {
	            throw new MalformedJwtException("Unable to read JSON value: " + val, e);
	     }
	}
}