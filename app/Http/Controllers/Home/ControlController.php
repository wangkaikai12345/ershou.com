<?php

namespace App\Http\Controllers\Home;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Hash;
// 导入 Intervention Image Manager Class
use Intervention\Image\ImageManager;

class ControlController extends Controller
{
	// 鱼塘塘主对鱼塘的配置设置 开始
		public function getChange(Request $request)
		{
			// 获取鱼塘的ID
				$id=$request->input('id');
			// 查询鱼塘的信息
				$data=DB::table('fishs')->where('id',$id)->first();
			// 带原数据返回视图
				return view('Home.Fish.change',['data'=>$data]);

		}
	// 鱼塘塘主对鱼塘的配置设置 结束

	// 塘主对鱼塘信息的修改操作 开始
		public function postUpdate(Request $request)
	    {
	    	// 获取数据
			    $data = $request->except('_token','old_t_pic','old_t_bac');
			    $oldpic=$request->input('old_t_pic');
			    $oldbac=$request->input('old_t_bac');
			// 图片的操作，判断是否上传新图片
	      		if (empty($data['t_pic']))
			    {
			        $data['t_pic']=$oldpic;
			    }else
		      	{
		        	if($oldpic != 'default.jpg')
			        {
			           unlink('./fish/'.$oldpic);
			        }
		          	$data['t_pic'] = self::upload($request, 't_pic');

		      	}
		      	if (empty($data['t_bac']))
			    {
			        $data['t_bac']=$oldbac;
			    }else
		      	{
		          	if($oldpic != 'default.jpg')
		          	{
		             unlink('./fish/'.$oldbac);
		          	}
		          	$data['t_bac'] = self::upload($request, 't_bac');
		          
		      	}
		    // 删除获取的数据中的ID，为数据插入做准备
			    $id=$data['id'];
			    unset($data['id']);
	      	// 执行数据插入
	      		$res=DB::table('fishs')->where('id',$id)->update($data);
			    if($res)
			    {
			        return redirect()->back()->with('success', '操作成功');
			    }else
			    {
			        return redirect()->back()->with('error', '操作失败');
			    }
	    }
	// 塘主对鱼塘信息的修改操作 结束

	// 图片上传函数 开始
		static public function upload($request,$picname)
	    {
	        //判断是否有文件上传catelist
	        if ($request->hasFile($picname))
	        {
	            //随机文件名
	            $name = time().rand(1, 999999);
	            //获取文件的后缀名
	            $suffix = $request->file($picname)->getClientOriginalExtension();
	            $arr = ['png', 'jpeg', 'gif', 'jpg'];
	            if (!in_array($suffix, $arr))
	            {
	                return back()->with('error', '上传文件格式不正确');
	            }
	            $request->file($picname)->move('./fish/',$name.'.'.$suffix);
	            //返回路径
	            return $name.'.'.$suffix;
	        }
	    }
	// 图片上传函数 结束

	// 塘主对鱼塘商品的踢出操作 开始
	    public function getOut(Request $request)
	    {
	    	// 获取数据，商品的ID
	    		$id=$request->input('id');
	    	// 执行修改操作
	    		$res=DB::table('goods')->where('id',$id)->update(['t_id'=>'0']);
		    	if($res)
		    	{
		    		return redirect()->back()->with('success', '移除商品成功');
		    	}else
		    	{
		    		return redirect()->back()->with('error', '移除商品失败');
		    	}
	    }
	// 塘主对鱼塘商品的踢出操作 结束

	// 塘主对鱼塘用户的踢出操作 开始
	    public function getOutuser(Request $request)
	    {
	    	// 获取数据，用户的ID
	    		$id=$request->input('id');
	    	// 获取鱼塘的ID
	    		$fish_id=$request->input('fish_id');
	    	// 执行数据库的修改和删除操作
		    	$res=DB::table('goods')->where('s_id',$id)->update(['t_id'=>'0']);
		    	$data=DB::table('fishmember')->where('member_id',$id)->where('fish_id',$fish_id)->delete();
		    	if($res && $data)
		    	{
		    		return redirect()->back()->with('success', '移除用户成功');
		    	}else
		    	{
		    		return redirect()->back()->with('error', '移除用户失败');
		    	}
	    }
	// 塘主对鱼塘用户的踢出操作 结束    
}

?>