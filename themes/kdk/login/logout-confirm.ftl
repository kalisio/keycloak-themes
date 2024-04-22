<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <!--
      Form section
    -->
    <#if section = "form">
        <!-- Title -->
        <div class="text-subtitle1 text-center" :class="{ 'q-pa-xs': $q.screen.xs, 'q-pa-sm': $q.screen.gt.xs }">
            ${msg("logoutConfirmTitle")}
        </div>
        <!-- Content -->
        <div class="full-width">
            <p class="instruction">${msg("logoutConfirmHeader")}</p>
            <q-form action="${url.logoutConfirmAction}" method="post">
                <input type="hidden" name="session_code" value="${logoutConfirm.code}">
                <q-btn id="kc-logout" name="confirmLogout" label="${msg("doLogout")}" color="primary" :loading="loginLoading" @click="loginLoading = true" type="submit" />
            </q-form>
            <div id="kc-info-message">
                <#if logoutConfirm.skipLink>
                <#else>
                    <#if (client.baseUrl)?has_content>
                        <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    </#if>
                </#if>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
