<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
<head>
    <title>${the_title} - ${company_name}</title>
    <meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
    <#if !is_signed_in>
        <link href="${css_folder}/home/header.css" type="text/css" rel="stylesheet">
        <link href="${css_folder}/home/body.css" type="text/css" rel="stylesheet">
        <link href="${css_folder}/home/footer.css" type="text/css" rel="stylesheet">
        <link href="${css_folder}/home/slider.css" type="text/css" rel="stylesheet">
    </#if>
</head>
<body class="${css_class}">
<@liferay_ui["quick-access"] contentId="#main-content" />
<@liferay_util["include"] page=body_top_include />
<@liferay.control_menu />
<!-- Show Header is signed out -->
<#if !is_signed_in>
    <#include "${full_templates_path}/header_login.ftl" />
</#if>
<!-- Show Header is signed out -->
<div class="container-fluid-max" id="wrapper">
    <header id="banner" role="banner">
		<#if has_navigation && is_setup_complete>
            <#include "${full_templates_path}/navigation.ftl" />
        </#if>
    </header>
    <section id="content">
        <h1 class="hide-accessible">${the_title}</h1>
		<#if selectable>
            <@liferay_util["include"] page=content_include />
        <#else>
            ${portletDisplay.recycle()}
            ${portletDisplay.setTitle(the_title)}
            <@liferay_theme["wrap-portlet"] page="portlet.ftl">
                <@liferay_util["include"] page=content_include />
            </@>
        </#if>
    </section>
    <#if !is_signed_in>
        <#include "${full_templates_path}/footer.ftl" />
    </#if>
</div>
<!-- Show Header is signed out -->
<#if !is_signed_in>
    <script>
        window.onscroll = function () {
            if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
                document.getElementById("div-header").className = "fixed-top div_header_scroll";
                document.getElementById("myBtn-slider").style.display = "block";
            } else {
                document.getElementById("div-header").className = "fixed-top div_header";
                document.getElementById("myBtn-slider").style.display = "none";
            }
        };
        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
</#if>
<!-- Show Header is signed out -->
<@liferay_util["include"] page=body_bottom_include />
<@liferay_util["include"] page=bottom_include />
</body>
</html>