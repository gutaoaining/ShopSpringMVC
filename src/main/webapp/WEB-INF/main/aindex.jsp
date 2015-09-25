<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'管理界面',split:true" style="width:200px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true,border:false">   
    <div title="系统设置" data-options="iconCls:'icon-save'">   
        <h3 style="color:#0099FF;">Accordion for jQuery</h3>   
        <p>Accordion is a part of easyui framework for jQuery.     
        It lets you define your accordion component on web page more easily.</p>   
    </div>   
    <div title="案列设置" data-options="iconCls:'icon-reload',selected:true">   
        content2    
    </div>   
    <div title="其他设置" data-options="iconCls:'icon-more',selected:true">   
        content3    
    </div>   
    </div>  
    </div>   
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>   
</body>  
</html>