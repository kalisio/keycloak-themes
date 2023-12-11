<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <!--
        Form section
    -->
    <#if section = "form">
        <div id="kc-form" class="full-width">
          <div id="kc-form-wrapper">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <div class="q-py-xs column">
                            <!--label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label -->    
                            <#if messagesPerField.existsError('username','password')>
                                <q-input 
                                    id="username" v-model="email" label="${msg('email')}" filled type="email" :error="true"
                                    error-message="${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"
                                />
                            <#else>
                                <q-input id="username" v-model="email" label="${msg('email')}" filled type="email" />
                            </#if>
                        </div>
                    </#if>
                    <div class="q-py-xs column">
                        <#if usernameHidden?? && messagesPerField.existsError('username')>
                            <q-input 
                                id="password" v-model="password" label="${msg('password')}" filled :type="showPassword ? 'text' : 'password'" autocomplete="off" :error="true"
                                error-message="${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"
                            >
                                <template v-slot:append>
                                    <q-icon :name="showPassword ? 'visibility' : 'visibility_off'" class="cursor-pointer" @click="showPassword = !showPassword" />
                                </template>
                            </q-input>
                        <#else>
                            <q-input id="password" v-model="password" label="${msg('password')}" filled :type="showPassword ? 'text' : 'password'" autocomplete="off">
                                <template v-slot:append>
                                    <q-icon :name="showPassword ? 'visibility' : 'visibility_off'" class="cursor-pointer" @click="showPassword = !showPassword" />
                                </template>
                            </q-input>
                        </#if>
                    </div>
                    <!-- Options -->
                    <div id="row items-center">
                        <#if realm.rememberMe && !usernameHidden??>
                            <div class="q-py-md checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                    </div>
                    <!-- Actions -->
                    <div class="q-pa-md row justify-center items-center">
                      <q-btn id="kc-login" label="${msg('login')}" color="primary" type="submit" />
                    </div>      
                </form>
                <!--
                  Extra actions
                -->
                <div class="row justify-center items-center">
                  <#if realm.resetPasswordAllowed>
                    <q-btn label="${msg('doForgotPassword')}" flat rounded no-caps href="${url.loginResetCredentialsUrl}" />
                  </#if>
                </div>
            </#if>
            </div>
        </div>
        
    <!--
        Info section
    -->        
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <!--
        SocialProviders sections
    -->
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h4>${msg("identity-provider-login-label")}</h4>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
