<#macro loginLayout displayMessage=true title="">
    <!DOCTYPE html>
    <html class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>
        <title>${msg("loginTitle",(realm.displayName!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
        <#if properties.stylesCommon?has_content>
            <#list properties.stylesCommon?split(' ') as style>
                <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>

        <style>
            :root {
                --primary-color: ${client.getAttribute("theme.primary-color")!'#ff656c'};
            }

            body {
                background: url('${client.getAttribute("theme.login.background-image-url")!''}') no-repeat fixed center center;
                background-size: cover;
            }

            .logo {
                background: url('${client.getAttribute("theme.logo")!''}') no-repeat;
            }

            .login-block {
                border-top: 5px solid var(--primary-color);
            }

            button.primary {
                background-color: var(--primary-color);
                color: #ffffff;
                border: none;
            }

            button.primary:hover {
                background-image: linear-gradient(rgb(0 0 0/15%), rgb(0 0 0/15%));
            }
        </style>
    </head>

    <body class="${properties.kcBodyClass!}">
        <div class="logo"></div>

        <div class="login-block">
            <h1>${title}</h1>

            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="alert alert-${message.type}">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <#nested "form">
        </div>
    </body>
    </html>
</#macro>
