<#import "template.ftl" as layout>

<@layout.loginLayout title=msg("updatePassword"); section>

    <#if section = "form">
        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
            <input
                type="hidden"
                id="username"
                name="username"
                value="${username}"
                autocomplete="username"
            />

            <input
                type="hidden"
                id="password"
                name="password"
                autocomplete="current-password"
            />

            <input
                type="password"
                id="password-new"
                name="password-new"
                autofocus
                autocomplete="new-password"
                aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                placeholder="${msg("newPassword")}"
            />

            <input
                type="password"
                id="password-confirm"
                name="password-confirm"
                autocomplete="new-password"
                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                placeholder="${msg("confirmPassword")}"
            />

            <button type="submit" class="primary">
                Submit
            </button>
        </form>
    </#if>

</@layout.loginLayout>
