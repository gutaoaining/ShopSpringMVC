<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
   <script type="text/javascript">
     $(function(){
    	 $('#categoryGrid').datagrid({    
    		    url:'categoryQueryAll.html',  
    		    striped : true,
    		    pagination : true,
    		    queryParams: {
    				keyword: '',
    			}, 		    
    		    pageSize : 3,
    		    pageList : [3,6,9,12,15],
    		    columns:[[    
    		        {field:'id',title:'ID号',width:100},    
    		        {field:'type',title:'商品类别',width:100},    
    		        {field:'hot',title:'热点',width:100},
    		        {field:'account.login',title:'管理名',width:100,
    		        	formatter: function(value,row,index){
        		         if(row.account!=null&&row.account.login!=null)
    				       return row.account.login;		
    					 }

        		    }
    	 
    		    ]]    
    	});   
     });
   </script>
</head>
<body>
<table id="categoryGrid"></table>
</body>
</html>