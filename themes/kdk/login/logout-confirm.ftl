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
            <p class="row justify-center">${msg("logoutConfirmHeader")}</p>
            <q-form action="${url.logoutConfirmAction}" method="post">
                <input type="hidden" name="session_code" value="${logoutConfirm.code}">
                <input type="hidden" name="confirmLogout" value="${msg("doLogout")}">
                <div class="row justify-around">
                    <#if logoutConfirm.skipLink>
                    <#else>
                        <#if (client.baseUrl)?has_content>
                            <q-btn outline href="${client.baseUrl}" color="primary" label="${kcSanitize(msg("backToApplication"))?no_esc}"></q-btn>
                        </#if>
                    </#if>
                    <q-btn id="kc-logout" name="confirmLogout" label="${msg("doLogout")}" color="primary" :loading="loginLoading" @click="loginLoading = true" type="submit" />
                </div>
            </q-form>
        </div>
    </#if>
</@layout.registrationLayout>
