package com.liferay.login.custom.portlet;

import com.liferay.login.custom.constants.LoginCustomPortletKeys;
import com.liferay.portal.kernel.model.CompanyConstants;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liferay.portal.kernel.security.auth.session.AuthenticatedSessionManagerUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.WebKeys;
import org.osgi.service.component.annotations.Component;

import java.io.IOException;

/**
 * @author FIS-GMC
 */
@Component(
        immediate = true,
        property = {
                "com.liferay.portlet.display-category=category.sample",
                "com.liferay.portlet.instanceable=false",
                "javax.portlet.display-name=Sign In (Custom)",
                "javax.portlet.init-param.template-path=/",
                "javax.portlet.init-param.view-template=/view.jsp",
                "javax.portlet.init-param.add-process-action-success-action=false",
                "javax.portlet.name=" + LoginCustomPortletKeys.LoginCustom,
                "javax.portlet.resource-bundle=content.Language",
                "javax.portlet.security-role-ref=power-user,user"
        },
        service = Portlet.class
)
public class LoginCustomPortlet extends MVCPortlet {

        @Override
        public void processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException {
                ThemeDisplay themeDisplay = (ThemeDisplay)actionRequest.getAttribute(WebKeys.THEME_DISPLAY);
                HttpServletRequest request = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(actionRequest));
                HttpServletResponse response = PortalUtil.getHttpServletResponse(actionResponse);

                String login = ParamUtil.getString(actionRequest, "login");
                String password = actionRequest.getParameter("password");
                boolean rememberMe = ParamUtil.getBoolean(actionRequest, "rememberMe");
                String authType = CompanyConstants.AUTH_TYPE_EA;
                try {
                        AuthenticatedSessionManagerUtil.login(request, response, login, password, rememberMe, authType);
                        actionResponse.sendRedirect(themeDisplay.getPathMain());
                } catch (Exception e) {
//                        actionResponse.addProperty();
                }
        }

}