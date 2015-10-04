<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
   <style type="text/css">
      #menu{
       width : 200px;
      }
      #menu ul{
        list-style : none;
        padding : 0px;
        margin : 0px;
      }
      #menu ul li{
        border-bottom : 1px solid #fff;
      }
      #menu ul li a{
       display : block;
       background-color : #008792;
       color : #fff;
       padding : 5px;
       text-decoration : none; 
      }
      #menu ul li a:hover{
       background-color : #00a6ac;
      }
      
   </style>
   <script type="text/javascript">
       $(function(){
           $("a[title]").on('click',function(){
               var text = $(this).text();
               var href = $(this).attr("title");
               if($('#tt').tabs('exists',text)){
            	   $('#tt').tabs('select',text);           	   
               }else{
            	   $('#tt').tabs('add',{       		
            			title : text,
            			closable:true,
            			content : '<iframe title="'+text+'" src="'+href+'" frameborder="0" width="100%" height="100%"/>'
            		});	                   
               }
            });
        });
   </script>
</head>

<body class="easyui-layout">   
    <div data-options="region:'north',title:'欢迎来到gt商城后台管理',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'系统操作',split:true" style="width:200px;">
    <div id="menu" class="easyui-accordion" data-options="fit:true">   
	    <div title="基本操作" data-options="iconCls:'icon-save'">   
	       <ul>
	          <li><a href="#" title="categoryPage.html">类别管理</a></li>
	          <li><a href="#" title="ProductPage.html">商品管理</a></li>
	       </ul>
	    </div>   
	    <div title="案列设置" data-options="iconCls:'icon-reload',selected:true">   
	        <ul>
	          <li><a href="#">类别管理</a></li>
	          <li><a href="#">商品管理</a></li>
	       </ul> 
	    </div>   
	    <div title="其他设置" data-options="iconCls:'icon-more',selected:true">   
	        <ul>
	          <li><a href="#">类别管理</a></li>
	          <li><a href="#">商品管理</a></li>
	       </ul>   
	    </div>   
    </div>  
    </div>   
    <div data-options="region:'center',title:'后台操作页面'" style="padding:1px;background:#fff;">
    
		    <div id="tt" class="easyui-tabs" data-options="fit:true">   
			    <div title="系统缺省页面" style="padding:10px;">   
			        系统缺省页面，用来以后先是系统的版本，硬件等各个方面的设置信息 
			    </div>   
		    </div>  
		    
    </div>   
     <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true">     
    </div>  
</body>  
</html>