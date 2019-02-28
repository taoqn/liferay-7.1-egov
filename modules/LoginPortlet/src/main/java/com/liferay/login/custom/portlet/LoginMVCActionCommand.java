package com.liferay.login.custom.portlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.model.CompanyConstants;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.security.auth.session.AuthenticatedSessionManagerUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.WebKeys;

@Component(
        property = {
                "javax.portlet.name=MyLoginPortlet",
                "mvc.command.name=/login/login",
                "service.ranking:Integer=100"
        },
        service = MVCActionCommand.class
)
public class LoginMVCActionCommand extends BaseMVCActionCommand {

    @Override
    public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) {
        return true;
    }

    @Override
    protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
        ThemeDisplay themeDisplay = (ThemeDisplay)actionRequest.getAttribute(WebKeys.THEME_DISPLAY);
        HttpServletRequest request = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(actionRequest));
        HttpServletResponse response = PortalUtil.getHttpServletResponse(actionResponse);

        String login = ParamUtil.getString(actionRequest, "login");
        String password = actionRequest.getParameter("password");
        boolean rememberMe = ParamUtil.getBoolean(actionRequest, "rememberMe");
        String authType = CompanyConstants.AUTH_TYPE_EA;

        AuthenticatedSessionManagerUtil.login(request, response, login, password, rememberMe, authType);
        actionResponse.sendRedirect(themeDisplay.getPathMain());
    }

}
