package com.thinkgem.jeesite.modules.wx.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.modules.sys.entity.SysWxInfo;

import org.springframework.ui.Model;


/**
 * 测试类
 * @author Wzy
 *
 */
@Controller
@RequestMapping(value = "test")
public class WxTestController extends WxBaseController{
	
	protected final String INDEX_INFO_TEST = "modules/wxp/testPayIndex";//首页

	
	/**
	 * 访问支付首页（默认登录,该页面返回支付按钮）
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/testPayIndex",method=RequestMethod.GET)
	public String testPayIndex(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		String openId = null;
		if(null != Global.TEST_WX_OPEN_ID) {
			//微信测试
			openId = Global.TEST_WX_OPEN_ID;
		}else {
			//是否已经注册并且激活
		    openId = (String)model.asMap().get("openId");
		    if(null == openId) {
				model.addAttribute("message",ERR_OPEN_ID_NOT_GET);
				return WX_ERROR;//微信号为空
			}
		    
		    SysWxInfo sysWxInfo = sysWxInfoService.findWxInfoByOpenId(openId);
			//如果没有注册 默认填充注册信息
			if(null == sysWxInfo) {
				model.addAttribute("message",ERR_USER_NO_AUTH);
				return WX_ERROR;//微信用户未授权
			}
			
			//绑定信息
			sysWxInfoService.tieInfo(openId);
			
			Date endDate = sysWxInfo.getTieEndDate();//结束绑定日期 如果结束 需要重新绑定
			if(endDate.before(new Date())) {
				//没有绑定数据 跳转到绑定页面
				sysWxInfoService.tieInfo(openId);
			}
		}
		//跳到首页
		return INDEX_INFO_TEST;
		
	}
	
	
	
	
	
	
}
