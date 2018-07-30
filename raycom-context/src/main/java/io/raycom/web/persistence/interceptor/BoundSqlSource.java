package io.raycom.web.persistence.interceptor;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.SqlSource;

public class BoundSqlSource implements SqlSource {
  private BoundSql boundSql;

  public BoundSqlSource(BoundSql boundSql) {
    this.boundSql = boundSql;
  }

  @Override public BoundSql getBoundSql(Object parameterObject) {
    return boundSql;
  }
}