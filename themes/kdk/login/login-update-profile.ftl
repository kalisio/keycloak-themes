<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','email','firstName','lastName'); section>
    <#if section = "form">
        <!-- Title -->
        <div class="text-subtitle1 text-center" :class="{ 'q-pa-xs': $q.screen.xs, 'q-pa-sm': $q.screen.gt.xs }">
          ${msg("loginProfileTitle")}
        </div>
        <!-- Content -->
        <div class="full-width">
            <q-form action="${url.loginAction}" method="post">
                <!-- Inputs -->
                <div class="q-py-xs column">
                    <q-input 
                        id="username" name="username" v-model="username" filled
                        label="${msg('username')}"
                        type="text"
                        :readonly="<#if user.editUsernameAllowed>false<#else>true</#if>"
                        :error="<#if messagesPerField.existsError('username')>true</#if>"
                        error-message="${kcSanitize(messagesPerField.get('username'))?no_esc}"
                        :hide-bottom-space="true"
                    />
                </div>
                <div class="q-py-xs column">
                    <q-input 
                        id="email" name="email" v-model="email" filled
                        label="${msg('email')}"
                        type="text"
                        :readonly="<#if user.editEmailAllowed>false<#else>true</#if>"
                        :error="<#if messagesPerField.existsError('email')>true</#if>"
                        error-message="${kcSanitize(messagesPerField.get('email'))?no_esc}"
                        :hide-bottom-space="true"
                    />
                </div>
                <div class="q-py-xs column">
                    <q-input 
                        id="firstName" name="firstName" v-model="firstName" filled
                        label="${msg('firstName')}"
                        type="text" 
                        :error="<#if messagesPerField.existsError('firstName')>true</#if>"
                        error-message="${kcSanitize(messagesPerField.get('firstName'))?no_esc}"
                        :hide-bottom-space="true"
                    />
                </div>
                <div class="q-py-xs column">
                    <q-input 
                        id="lastName" name="lastName" v-model="lastName" filled
                        label="${msg('lastName')}"
                        type="text"
                        :error="<#if messagesPerField.existsError('lastName')>true</#if>"
                        error-message="${kcSanitize(messagesPerField.get('lastName'))?no_esc}"
                        :hide-bottom-space="true"
                    />
                </div>
                <!-- Submit actions -->
                <div class="row justify-center" :class="{ 'q-pa-sm': $q.screen.xs, 'q-pa-md': $q.screen.gt.xs }">
                    <#if isAppInitiatedAction??>
                        <q-btn id="login" name="login" class="q-mx-sm" label="${msg("doSubmit")}" color="primary" :loading="loginLoading" @click="loginLoading = true" type="submit"></q-btn>
                        <q-btn id="cancel-aia" name="cancel-aia" class="q-mx-sm" label="${msg("doCancel")}" color="negative" :loading="loginLoading" @click="loginLoading = true" type="submit"></q-btn>
                    <#else>
                        <q-btn id="login" name="login" label="${msg("doSubmit")}" color="primary" :loading="loginLoading" @click="loginLoading = true" type="submit" />
                    </#if>
                </div>
            </q-form>
        </div>
    </#if>
</@layout.registrationLayout>
