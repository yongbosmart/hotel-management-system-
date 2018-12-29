package jp;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Little {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s="查询 2017年 4月 1日 住在 酒店 的 顾客 姓名 ， 手机号 ， 性别 ";//查一查 现在 所有 空房 
		String sql="";
		String all="";
		String and="";
		String match="";
		String tmp1="";
		String tmp2="";
		String tmp3="";
		int cn=1;
		int tn=1;
		int in=1;
		char[] prec=new char[500];
		String[] column=new String[500];
		String[] iff=new String[500];
		String[] pres=new String[500];
		String[] table=new String[500];
		String time="";
		for (int i = 0; i < prec.length; i++) {
			prec[i]='$';
		}
		for (int i = 0; i < pres.length; i++) {
			pres[i]="";
			table[i]="";
			column[i]="";
			iff[i]="";
		}
		for (int i = 0; i <s.length(); i++) {
			prec[i]=s.charAt(i);
		}
		int i=0,j=0;
		while(prec[i]!='$') {
			if(prec[i]==32) {
				j++;
				i++;
			}
			else {
				pres[j]+=prec[i];
				i++;
			}
		}
		for (int j2 = 0; j2 < j+1; j2++) {
			System.out.println(pres[j2]);
		}
		
		for (int j2 = 0; j2 < j+1; j2++) {
			if(pres[j2].equals("查询")|pres[j2].equals("查一查")|pres[j2].equals("查找")|pres[j2].equals("找寻")) 
				sql+=" select ";
			if(pres[j2].equals("预订")|pres[j2].equals("预定")) {
				table[tn]=" preroom ";tn++;
			}
			if(pres[j2].equals("房间")|pres[j2].equals("客房")) {
				if(!pres[j2+1].equals("号")) {
				if(!table[tn-1].equals(" preroom ")) {
					table[tn]=" room ";tn++;
				}
				}
				else {
					column[cn]=" roomid ";cn++;
				}
			}
			if(pres[j2].equals("开房")) {
				table[tn]=" newroom ";tn++;
			}
			if(pres[j2].equals("顾客")|pres[j2].equals("客人")) {
				if(!table[tn-1].equals(" newroom ")) {
					table[tn]=" newroom ";tn++;
				}
			}
			
			if(pres[j2].equalsIgnoreCase("vip")|pres[j2].equals("会员")) {
				table[tn]=" vip ";tn++;
			}
			if(pres[j2].equals("员工")) {
				table[tn]=" employee ";tn++;
			}
			if(pres[j2].equals("退房")) {
				table[tn]=" celroom ";tn++;
			}
			if(pres[j2].equals("2017年")|pres[j2].equals("2017")|pres[j2].equals("今年")) {
				time+="\"2017-";
			}
			if(pres[j2].equals("2016年")|pres[j2].equals("2016")|pres[j2].equals("去年")) {
				time+="\"2016-";
			}
			if((!time.equals(""))&&(pres[j2-1].equals("2017年")|pres[j2-1].equals("2017")|pres[j2-1].equals("今年"))){
				if(pres[j2].length()==2)
					pres[j2]="0"+pres[j2].charAt(0)+"-";
				else
					pres[j2]=pres[j2].charAt(0)+"-";
				if(pres[j2+1].length()==2)
					pres[j2+1]="0"+pres[j2+1].charAt(0);
				else
					pres[j2+1]=pres[j2+1].charAt(0)+"";
				   time+=pres[j2]+pres[j2+1]+"\"";
			}
			if(pres[j2].equals("现在")|pres[j2].equals("当前")|pres[j2].equals("当下")|pres[j2].equals("今天")){
				 Date currentTime = new Date();
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				 time="\"" +formatter.format(currentTime)+"\"";
			}
			if(pres[j2].equals("姓名")|pres[j2].equals("名字")|pres[j2].equals("名称")){
				if(pres[j2+1].equals("是")) {
					iff[in]=" name ="+pres[j2+2];
					in++;
				}
				else {
					column[cn]=" name ";//三个表可能共同拥有的属性
				     cn++;
				}
			}
			if(pres[j2].equals("年龄")|pres[j2].equals("年纪")){
				if(pres[j2+1].equals("是")) {
					iff[in]=" age ="+pres[j2+2];
					in++;
				}
				else if(pres[j2+1].equals("大于")) {
					iff[in]=" age >"+pres[j2+2];
					in++;
				}
				else if(pres[j2+1].equals("小于")) {
					iff[in]=" age <"+pres[j2+2];
					in++;
				}
				else {
					column[cn]=" age ";
				     cn++;
				}
			}
			if(pres[j2].equals("性别")&!(pres[j2+1].equals("为男")|pres[j2+1].equals("为女"))){
				if(!pres[j2+1].equals("为")&!pres[j2+1].equals("是"))	{
					column[cn]=" sex ";
					     cn++;
					}else {
						iff[in]=" sex=\""+pres[j2+2]+"\" ";
						in++;
					}
			}
			if(pres[j2].equals("性别是")){
				iff[in]=" sex ="+pres[j2+1];
				in++;
			}
			if(pres[j2].equals("信息")){
				all="*";
			}
			if(pres[j2].equals("为女")){
				iff[in]=" sex=\"女\"";
				in++;
			}
			if(pres[j2].equals("为男")){
				iff[in]="sex=\"男\"";
				in++;
			}
			if(pres[j2].equals("身份")){
				if(pres[j2+1].equals("是")) {
					iff[in]=" customerid ="+pres[j2+2];
					in++;
				}
				else {
					column[cn]=" customerid ";//两个表有两种表示
				     cn++;
				}
			}
			if(pres[j2].equals("手机号")|pres[j2].equals("手机")){
				if(pres[j2+1].equals("是")) {
					iff[in]=" phone ="+pres[j2+2];//两个表共同拥有属性
					in++;
				}
				else if(pres[j2+2].equals("是")) {
					iff[in]=" phone ="+pres[j2+3];
					in++;
				}
				else {
					column[cn]=" phone ";
				     cn++;
				}
			}
			if(pres[j2].equals("会员号")){
				if(pres[j2+1].equals("是")) {
					iff[in]=" vipid ="+pres[j2+2];
					in++;
				}
				else {
					column[cn]=" vipid ";
				     cn++;
				}
			}
			if(pres[j2].equals("密码")){
				if(pres[j2+1].equals("是")) {
					iff[in]=" vippassword ="+pres[j2+2];
					in++;
				}
				else {
					column[cn]=" vippassword ";
				     cn++;
				}
			}
			if(pres[j2].equals("房型")|pres[j2].equals("屋型")|pres[j2].equals("房间名")|pres[j2].equals("屋名")) {
				if(pres[j2+1].equals("是")) {
					iff[in]=" room.name ="+pres[j2+2];
					in++;
				}
				else {
					column[cn]="room.name";
				     cn++;
				}
			}
			if(pres[j2].equals("而且")|pres[j2].equals("并且")){
				and="and";
			}
			if(pres[j2].equals("时间")|pres[j2].equals("日期")){
				column[cn]="ndate";
			    cn++;
			}
			if(pres[j2].equals("满")|pres[j2].equals("为满")|pres[j2].equals("满房")) {
				iff[in]=" room.state =\"满\"";
				in++;
			}
			if(pres[j2].equals("空")|pres[j2].equals("为空")|pres[j2].equals("空房")) {
				iff[in]=" room.state =\"空\"";
				in++;
			}
			
			if(pres[j2].equals("房间号")|pres[j2].equals("房号")) {
				if(pres[j2+1].equals("是")) {
					iff[in]=" roomid ="+pres[j2+2];
					in++;
				}
				else {
					column[cn]=" roomid ";
				    cn++;
				}
			}
		}
		
		if(tn!=2) {
			for (int j3 = 1; j3 <tn; j3++) {
				System.out.println(tn+1);
				if(table[j3].equals(" vip "))
					tmp1="x";
				if(table[j3].equals(" newroom "))
					tmp2="y";
				if(table[j3].equals(" preroom "))
					tmp3="z";
			}
			if(!tmp1.equals("")&!tmp3.equals("")&tmp2.equals("")) {//vip与pre
				System.out.println(tn+2);
				match+=" vip.vipid=preroom.vipid ";
				for (int j3 = 1; j3 <=cn-1; j3++) {
					if(column[cn].equals(" vipid ")) {
						column[cn]="vip.vidid";
					}
				}
				for (int k = 1; k <= tn-1; k++) {
					if(table[k].equals(" room ")) {
						match+=" and room.roomid=preroom.roompid ";
						if(column[cn].equals(" roomid ")) {
							column[cn]="room.roomid";
						}
					}
					if(table[k].equals(" newroom ")) {
						match+=" and newroom.roomid=preroom.roompid ";
						if(column[cn].equals(" roomid ")) {
							column[cn]="newroom.roomid";
						}
					}
				}
				
			}
			else if(!tmp1.equals("")&tmp3.equals("")&!tmp2.equals("")) {//vip与newroom
				System.out.println(tn+2);
				match+=" vip.myid=newroom.customerid ";
				for (int k = 1; k <=tn-1; k++) {
					if(table[k].equals(" room ")) {
						match+=" and room.roomid=newroom.roompid ";
						if(column[cn].equals(" roomid ")) {
							column[cn]="newroom.roomid";
						}
					}
				}
				
			}
			else if(!tmp1.equals("")&!tmp3.equals("")&!tmp2.equals("")) {
				System.out.println(tn+2);
				match+=" vip.myid=newroom.customerid and vip.vipid=preroom.vipid";
				for (int k = 1; k < tn-1; k++) {
					if(table[k].equals(" room "))
						match+=" and room.roomid=preroom.roompid ";
					
				}
				
			}
			else{
				match+=table[1]+".roomid ="+table[2]+".roomid";
				for (int j3 =2; j3 < tn-1; j3++) {
					match+=table[j3]+".roomid ="+table[j3+1]+".roomid";
				}
			}
		}
		
			
		
		
		if(all.equals("")) {
			sql+=column[1]+" ";
			if(cn!=2)
				for (int j3 = 2; j3 <cn; j3++) {
					sql+=" , "+column[j3];
				}
		}else {
			sql+=all;
		}
		sql+=" from ";
			
			
			sql+=table[1];
			if(tn!=2)
		for (int j3 = 2; j3 <tn; j3++) {
			sql+=" , "+table[j3];
		}
		
		
		if(!iff[1].equals("")||!time.equals("")||!match.equals("")) {
			sql+=" where ";
			if(!time.equals("")) {
				sql+= "nadte = "+time+" ";
				if(!iff[1].equals("")) {
					sql+=" and ";
				}
				if(iff[1].equals("")&!match.equalsIgnoreCase(""))
					sql+=" and ";
			}
			if(!iff[1].equals("")) {
				
				sql+=iff[1];
				if(in!=1)
			for (int j3 = 2; j3 <in; j3++) {
				sql+=" and "+iff[j3];
			}
				if(!match.equals("")) {
					sql+=" and ";
				}
			}
			if(!match.equals(""))
				sql+=match;
			
		}
		System.out.println(match);
		System.out.println(sql);
	}

}
