package io.raycom.initialize.init;

public class InitProcessStatic{

	private static String isRun ="N"; 
	//已完成次数
	private static int fileProcessNo  = 0; 
	private static int tableProcessNo = 0; 
	private static int dataProcessNo  = 0; 
	
	private static int dataTotalProcessNo  = 0; 
	private static int tableTotalProcessNo  = 0;
	
	public static String getIsRun() {
		return isRun;
	}
	public static void initRun() {
		InitProcessStatic.isRun = "N";
	}
	public static void setRunning() {
		InitProcessStatic.isRun = "Y";
	}
	public static void setRunned() {
		InitProcessStatic.isRun = "OK";
	}
	public static int getFileProcessNo() {
		return fileProcessNo;
	}
	public static void setFileProcessNo(int fileProcessNo) {
		InitProcessStatic.fileProcessNo = fileProcessNo;
	}
	public static int getTableProcessNo() {
		return tableProcessNo;
	}
	public static void setTableProcessNo(int tableProcessNo) {
		InitProcessStatic.tableProcessNo = tableProcessNo;
	}
	public static int getDataProcessNo() {
		return dataProcessNo;
	}
	public static void setDataProcessNo(int dataProcessNo) {
		InitProcessStatic.dataProcessNo = dataProcessNo;
	}
	public static int getDataTotalProcessNo() {
		return dataTotalProcessNo;
	}
	public static void setDataTotalProcessNo(int dataTotalProcessNo) {
		InitProcessStatic.dataTotalProcessNo = dataTotalProcessNo;
	}
	public static int getTableTotalProcessNo() {
		return tableTotalProcessNo;
	}
	public static void setTableTotalProcessNo(int tableTotalProcessNo) {
		InitProcessStatic.tableTotalProcessNo = tableTotalProcessNo;
	} 
	
	
}