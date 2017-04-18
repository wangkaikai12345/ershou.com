<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class AdController extends Controller
{
	//后台查询开始
		public function getIndex(Request $request)
		{
			//每页显示几条
		    	$num = $request ->input('num',2);
		    //判断用户是否搜素
			    if($request->input('title'))
			    {
			    	$ads = DB::table('ad')
			        ->where('title','like','%'.$request->input('title').'%')
			        ->paginate($num);
			    }else
			    {
			    	$ads = DB::table('ad')->paginate($num);
			    }
			    $all = $request -> all();
			    return view('Admin.Ad.index',['ads'=>$ads,'all'=>$all]);
		}
	//后台查询结束

	//广告添加开始
		public function getAdd()
		{
		   //显示用户添加表单
		   		return view('Admin.Ad.add');
		}
		//form单请求类 验证
		public function postInsert(Request $request)
		{
		    $data = $request->except(['_token']);
		    $data['pic'] = self::upload($request);
		    //判断  
			    $res = DB::table('ad')->insertGetId($data);
			    if($res)
			    {
			      	return redirect('Admin/Ad/index')->with('success','添加成功');
			   	}else
			   	{
			        return back()->withInput()->with('error','添加失败');
			    }
		}
	//广告添加结束

	//删除操作开始
		public function getDelete(Request $request)
		{
     		//接收数据
      			$id = $request->input('id');
        	//删除
      			$res = DB::table('ad')->where('id','=',$id)->delete();
      		//判断
	        	if($res)
	      		{
	        		return redirect('Admin/Ad/index')->with('success','用户删除成功');
	      		}else
	      		{
	        		return redirect('Admin/Ad/index')->with('error','用户删除失败');
	      		}
		}
	//删除操作结束   

	//修改操作开始
		public function getEdit(Request $request)
		{
			//接收id
	        	$id = $request->input('id');
	        //查询用户信息
	    		$res = DB::table('ad')->where('id',$id)->first();
	        //解析模板 分配数据
	       		return view('Admin.Ad.edit',['ads'=>$res]);
		}
	    //执行用户修改
	    public function postUpdate(Request $request)
	    {
	        //提取数据
	        	$data = $request->except('_token');
	        //调用上传方法 
	        	$data['pic'] = self::upload($request);
	        //判断
		       	$res = DB::table('ad')->where('id',$data['id'])->update($data);
		        //dd($res);
		        if($res)
		        {
		            return redirect('Admin/Ad/index')->with('success','用户修改成功');
		        }else
		        {
		        	return back()->withInput()->with('error','用户修改失败');
		    	}
		}
	//修改操作结束
	 
	//图片上传开始
		static public function upload($request)
		{
	        //判断是否有文件上传
	        if($request->hasFile('pic'))
	        {
	            //随机文件名
	        		$name = md5(time()+rand(1,999999));
	            //获取文件的后缀名
	           		$suffix = $request->file('pic')->getClientOriginalExtension();
	            	$arr = ['png','jpeg','gif','jpg'];
	            	if(!in_array($suffix,$arr))
	           		{
	                	return back()->with('error','上传文件格式不正确');
	            	}
	          	  	$request->file('pic')->move('./uploads/', $name.'.'.$suffix);
	            //返回路径
	            	return '/uploads/'.$name.'.'.$suffix;
		    }
		}
	//图片上传结束
}