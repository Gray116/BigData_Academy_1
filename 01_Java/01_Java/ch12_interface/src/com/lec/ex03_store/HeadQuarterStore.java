/* 본사 음식점의 가격을 분점에서는 다르게 출력해보기 */

package com.lec.ex03_store;

public interface HeadQuarterStore { 
	public abstract void kimchi(); 
	public abstract void budae();
	public abstract void bibim();
	public abstract void sundae() ;
	public abstract void kongki();
	public String getName();
}