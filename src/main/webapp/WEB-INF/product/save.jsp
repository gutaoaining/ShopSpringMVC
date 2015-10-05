<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 引入公共的JSP片段 -->
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	<script type="text/javascript">
       $(function(){
    	   $.extend($.fn.validatebox.defaults.rules, {    
    		    format : {    
    		        validator: function(value,param){
        		        var arr = param[0].split(',');
        		        var extname = value.substring(value.lastIndexOf('.')+1);
        		        for(var i = 0; i < arr.length; i++){
                            if(extname == arr[i]){
                                return true;
                            }
            		    }    
    		            return false;    
    		        },    
    		        message: '请选择合适的图片格式(jpg,png,jpeg,gif)'  
    		    }    
    		});  
    	   $('input[name=name]').validatebox({    
               required: true,    
               missingMessage : '商品名称为空！' 
           }); 
    	   $('input[name=price]').numberbox({ 
    		   min : 0,    
    		   precision : 2 ,
    		   prefix : '￥',   
               required: true,
               missingMessage : '请填写商品价格'
           }); 
    	   $('input[name=upload]').validatebox({ 
    		   validType : "format['jpg,png,jpeg,gif']"
           });
    	   $('#cc').combobox({    
       	    url:'productType.html',  
       	    panelHeight : 'auto',
       	    panelWidth : 120,
       	    width : 120,  
       	    editable : false,
       	    valueField:'id',    
       	    textField:'type',
       	    required: true,
       	    missingMessage : '请选择商品类别'  
           }); 
           $("textarea[name=remark]").validatebox({
        	   required: true,
          	   missingMessage : '请输入描述'  
           });
    	   $('input[name=upload]').change(function(){ 
    		   $(this).validatebox('validate');
           });
    	   $('#add_product_form').form('disableValidation');
    	   $("#add_product_btn").on('click',function(){
    		   $('#add_product_form').form('enableValidation');
               if($('#add_product_form').form('validate')){
               	$('#add_product_form').form('submit', {    
               	    url:'productSave.html',      
               	    success : function(data){  
                   	 if(data){           	
               	    	 parent.$('#win').window('close');
               	    	 //通过穿换成dom对象从而拿到相应的节点元素，这是在浏览器不兼容是一种很有效的方法  
                         var dg =  parent.$('iframe[title="商品管理"]').get(0).contentWindow.$("#categoryGrid");   
                         dg.datagrid('reload'); 
                           }   
               	    }    
               	}); 
                $.ajax({}); 
               }
           });
           $("#reset").click(function(){
              $("#add_product_form").form('reset');
           });
        });
   </script>
</head>

<body>
<form title="添加商品" id="add_product_form" method="post" enctype="multipart/form-data">
	<div>
		<label>商品名称:</label> <input type="text" name="name" />
	</div>
	<div>
		<label>商品价格:</label> <input type="text" name="price" />
	</div>
	<div>
		<label>图片上传:</label> <input type="file" name="uploadfile" />
	</div>
	<div>
		<label>所属类别：</label> 
		<select id="cc" name="cid">
		</select>
	</div>
	<div>
		<label>加入推荐:</label><input type="radio" name="commend"
			checked="checked" value="true" />推荐  <input type="radio"
			name="commend" value="false" />不推荐 
	</div>
	<div>
		<label>是否有效:</label>
		<input type="radio" name="open" checked="checked"value="true" />上架
		<input type="radio" name="open" value="false" />下架
				
	</div>
	<div>
		<label>简单描述:</label>
		<textarea name="remark" cols="40" rows="4"></textarea>
	</div>
	<div>
		<label>详细描述:</label>
		<textarea name="xremark" cols="40" rows="6"></textarea>
	</div>
	<div>
		<a id="add_product_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重 置</a>
	</div>
</form>
</body>
</html>
