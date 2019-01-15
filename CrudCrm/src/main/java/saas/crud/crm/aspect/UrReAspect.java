package saas.crud.crm.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class UrReAspect {
	
	//이중보안 비밀번호 재확인 Aspect
		@Around("execution(* ure*(..))")
		public Object UserReconfirm(ProceedingJoinPoint joinPoint) throws Throwable {
			
			//before
			Object[] args=joinPoint.getArgs();
			
			for(Object tmp:args){
				
				if(tmp instanceof HttpServletRequest){
			
					HttpServletRequest request=(HttpServletRequest)tmp;
			
					String userId = (String)request.getSession().getAttribute("USERID");
					ModelAndView mView=new ModelAndView();
					
					if(userId != null) {
						
						String query = request.getQueryString();
						//원래 가야할 요청명 
						String url=null;
						if(query==null){
							url=request.getRequestURI();
						}else{
							url=request.getRequestURI()+"?"+query;
						}
						
						mView.setViewName("redirect:/reconfirm?url="+url); 
						return mView;
						
					}else {
						
						String query = request.getQueryString();
						//원래 가야할 요청명 
						String url=null;
						if(query==null){
							url=request.getRequestURI();
						}else{
							url=request.getRequestURI()+"?"+query;
						}
						
						mView.setViewName("redirect:/login?url="+url); 
						return mView;
						
					}														
				}
			}
			
			return joinPoint.proceed();
			//after
			
		}
	
}
