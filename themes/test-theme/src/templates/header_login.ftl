<#include "${full_templates_path}/slider.ftl" />
<header id="div-header" class="fixed-top div_header">
    <nav id="header_top" class="navbar navbar-light d-none d-lg-block div_header_top">
        <div class="container">
            <div class="row">
                <div class="col-md-auto">
                    <img class="cursor-pointer" src="${images_folder}/icon_top/u190.png">
                    <span class="span_header_title cursor-pointer">Việt Nam</span>
                </div>
                <div class="col-md-auto">
                    <img class="cursor-pointer" src="${images_folder}/icon_top/u195.png">
                    <span class="span_header_title cursor-pointer">English</span>
                </div>
                <div class="col">
                    <div class="float-right">
                        <span>
                            <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow" style="color: #fff">${sign_in_text}</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <nav id="header_bottom" class="navbar navbar-expand-lg navbar-light div_header_bottom">
        <div class="container-fluid">
            <!-- Header hide on screens wider than lg -->
            <div class="navbar-brand d-none d-lg-block">
                <div class="header_bottom_content">
                    <div id="logo_index">
                        <a class="${logo_css_class}" href="${site_default_url}"
                           title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                            <img alt="${logo_description}" height="65" src="${site_logo}" width="60"/>
                        </a>
                    </div>
                    <div>
                        <div id="title-name">
                            <div id="header_site_name" class="header_bottom_site">
                                <#if show_site_name>
                                    <span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">${site_name}</span>
                                </#if>
                            </div>
                            <div id="header_sub_name" class="header_bottom_sub">
                                <span>Truy cập đến các dịch vụ công toàn quốc</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header hide on screens smaller than lg -->
            <div class="navbar-brand d-lg-none">
                <a class="${logo_css_class}" href="${site_default_url}"
                   title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                    <img src="${site_logo}" alt="${logo_description}" width="40" height="40" class="d-inline-block align-top"/>
                <#--<h5 style="text-overflow: ellipsis">${site_name}</h5>-->
                </a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="main_nav collapse navbar-collapse" id="navbarSupportedContent">
                <ul id="menu_header_sld" class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a href="#p_p_id_com_liferay_wiki_web_portlet_WikiPortlet_">Thủ tục hành chính</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" name="tinhhinh_tthc_content">Số liệu thống kê</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" name="hoidap_content">Hỏi đáp</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" name="hoidap_content">Phản ánh kiến nghị</a>
                    </li>
                    <li class="nav-item d-lg-none">
                        <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>