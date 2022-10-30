<#import "template.ftl" as layout>

<@layout.loginLayout title=msg("login"); section>

    <#if section = "form">
        <form id="login-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <input
                type="text"
                value=""
                placeholder="${msg("username")}"
                id="username"
                name="username"
                autofocus
                autocomplete="username"
            />

            <input
                type="password"
                value=""
                placeholder="${msg("password")}"
                id="password"
                name="password"
                autocomplete="password"
            />

            <button type="submit">Submit</button>
        </form>
    </#if>

</@layout.loginLayout>
