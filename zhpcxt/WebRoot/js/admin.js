//用户登录
function login(path,closed){
	$("body").append("<div id='dlg_login' style='padding:20px;'></div>");
	$('#dlg_login').dialog({
		href:path+'/admin/login.jsp',
		modal:true,
		closed:closed,
	    title:'用户登录',
	    width:300,
	    height:190,
	    closable:false,
	    buttons:[{
	        text:'登录',
	        iconCls:'icon-ok',
	        handler:function(){
	            $('#form_login').form('submit',{
	            	url:path+'/AdminLoginServlet',
	                onSubmit:function(){
				        return $(this).form('validate');
				    },
				    success:function(data){
				    	if(data == "1"){
				    		$.messager.alert('系统消息','用户名或密码错误','error');
				    	}else{
				    		//window.navigate(path+'/index.jsp');
				    		$.messager.alert('系统消息','登录成功','info',function(){
					    		$('#dlg_login').dialog('refresh');
					    		$('#dlg_login').dialog('close');
					    		location.href = path+'/admin/index.jsp';				    			
				    		},false);
				    	} 
				    }
	            });
	        }
	    },{
	        text:'注册',
	        iconCls:'icon-reload',
	        handler:function(){
	            $("body").append("<div id='dlg_reg' style='padding:20px;'></div>");
	            $('#dlg_reg').dialog({
					href:path+'/admin/reg.jsp',
					modal:true,
					closed:false,
				    title:'用户注册',
				    width:300,
				    height:450,
				    buttons:[{
				        text:'注册',
				        iconCls:'icon-ok',
				        handler:function(){
				            $('#form_reg').form('submit',{
				            	url:path+'/RegServlet?type=reg',
				                onSubmit:function(){
							        return $(this).form('validate');
							    },
							    success:function(data){
							    	if(data == "-1"){
							    		$.messager.alert('系统消息','学号已存在','error');
							    	}else{
							    		$.messager.alert('系统消息','注册成功，请登录','info');
							    		$('#dlg_reg').dialog('refresh');
							    		$('#dlg_reg').dialog('close');
							    	} 
							    }  
				            });
				        }
				    },{
				        text:'重置',
				        iconCls:'icon-reload',
				        handler:function(){
				            $('#dlg_reg').dialog('refresh');
				        }
				    }]
				});
	        }
	    }]
	});
}
//修改密码
function editpass(path){
	$("body").append("<div id='dlg_update_pwd' style='padding:20px;'></div>");
	$('#dlg_update_pwd').dialog({
		href:path+'/admin/pwd_update.jsp',
		modal:true,
		closed:false,
		title:'修改密码',
		width:310,
		height:200,
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
				$('#form_pwd_update').form('submit',{
					url:path+'/PwdUpdateServlet',
					onSubmit:function(){
						return $(this).form('validate');
					},
					success:function(data){
						if(data == "-1"){
							$.messager.alert('系统消息','修改密码失败','error');
						}else{
							$.messager.alert('系统消息','密码修改成功','info');
							$('#dlg_update_pwd').dialog('refresh');
							$('#dlg_update_pwd').dialog('close');
						} 
					}  
				});
			}
		},{
			text:'重置',
			iconCls:'icon-reload',
			handler:function(){
				$('#dlg_update_pwd').dialog('refresh');
			}
		}]
	});
}
//添加管理员
function adminAdd(path){
	$("body").append("<div id='dlg_systemuser_add' style='padding:20px;'></div>");
	$('#dlg_systemuser_add').dialog({
		href:path+'/admin/systemuser_add.jsp',
		modal:true,
		closed:false,
	    title:'添加辅导员',
	    width:300,
	    height:200,
	    buttons:[{
	        text:'提交',
	        iconCls:'icon-ok',
	        handler:function(){
	            $('#form_systemuser_add').form('submit',{
	            	url:path+'/AdminAddServlet',
	                onSubmit:function(){
				        return $(this).form('validate');
				    },
				    success:function(data){
				    	if(data == "-1"){
				    		$.messager.alert('系统消息','用户名已存在','error');
				    	}else{
				    		$.messager.alert('系统消息','添加成功','info',function(){
					    		$('#dlg_login').dialog('refresh');
					    		$('#dlg_login').dialog('close');
					    		location.href = path+'/admin/systemuser.jsp';				    			
				    		},false);
				    	} 
				    }  
	            });
	        }
	    },{
	        text:'重置',
	        iconCls:'icon-reload',
	        handler:function(){
	            $('#dlg_systemuser_add').dialog('refresh');
	        }
	    }]
	});
}

//用户注销
function logout(path){
	$.ajax({
   		type: 'POST',
   		url: path+'/RemoveServlet',
   		data: 'mark=admin',
	   	success: function(msg){
	     window.location.href(path+'/admin/index.jsp');
	   }
	});
}
//解析JSON
function parseJson (text) {
	//extract JSON string
	var match;
	if ((match = /\{[\s\S]*\}|\[[\s\S]*\]/.exec(text))) {
		text = match[0];
	}
	var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
	cx.lastIndex = 0;
	if (cx.test(text)) {
		text = text.replace(cx, function (a) {
			return '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
		});
	}
	if (/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
		return eval('(' + text + ')');
	}
	throw 'JSON parse error';
}
//上传文件
function upload(path){
	$("body").append("<div id='dlg_upload' style='padding:20px;'></div>");
	$('#dlg_upload').dialog({
		href:path+'/admin/upload_file.jsp',
		modal:true,
		closed:false,
	    title:'上传文件',
	    width:450,
	    height:150,
	    closable:true,
	    buttons:[{
	        text:'上传',
	        iconCls:'icon-ok',
	        handler:function(){
	            $('#upload_file').form('submit',{
	            	url:path+'/admin/upload_json.jsp',
	                onSubmit:function(){
				        return $(this).form('validate');
				    },
				    success:function(data){
				    	var json = parseJson(data);
				    	if(json.error === 1){
				    		$.messager.alert('系统消息',json.message,'error');
				    	}else{
				    		//window.navigate(path+'/index.jsp');
				    		$.messager.alert('系统消息','上传成功','info',function(){
					    		$('#dlg_upload').dialog('refresh');
					    		$('#dlg_upload').dialog('close');
					    		$('#paths').val(json.url);				    			
				    		},false);
				    	} 
				    }
	            });
	        }
	    },{
	        text:'重置',
	        iconCls:'icon-reload',
	        handler:function(){
	            $('#dlg_upload').dialog('refresh');
	        }
	    }]
	});
}