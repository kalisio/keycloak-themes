<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <!--
        Form section
    -->
    <#if section = "form">
      <!-- Title -->
      <div 
        class="text-subtitle1 text-center"
        :class="{ 'q-pa-xs': $q.screen.xs, 'q-pa-sm': $q.screen.gt.xs }"
      >
          ${msg("updatePasswordTitle")}
      </div>
      <!-- Content -->
      <div class="full-width">
        <q-form action="${url.loginAction}" method="post">
          <!-- New password -->
          <div class="q-py-xs column">
            <q-input 
              id="password-new" name="password-new" v-model="passwordNew" label="${msg('passwordNew')}" filled :type="showPasswordNew ? 'text' : 'password'" autocomplete="off" 
              :error="<#if messagesPerField.existsError('password','password-confirm')>true<#else>false</#if>"
              error-message="${kcSanitize(messagesPerField.get('password'))?no_esc}"
              :hide-bottom-space="true"
            >
              <template v-slot:append>
                <q-icon :name="showPassword ? 'visibility' : 'visibility_off'" class="cursor-pointer" @click="showPasswordNew = !showPasswordNew" />
              </template>
            </q-input>
          </div>
          <!-- Confirm password -->
          <div class="q-py-xs column">
            <q-input 
              id="password-cofimr" name="password-confirm" v-model="passwordConfirm" label="${msg('passwordConfirm')}" filled :type="showPasswordConfirm ? 'text' : 'password'" autocomplete="off" 
              :error="<#if messagesPerField.existsError('password','password-confirm')>true<#else>false</#if>"
              error-message="${kcSanitize(messagesPerField.get('password'))?no_esc}"
              :hide-bottom-space="true"
            >
              <template v-slot:append>
                <q-icon :name="showPassword ? 'visibility' : 'visibility_off'" class="cursor-pointer" @click="showPasswordConfirm = !showPasswordConfirm" />
              </template>
            </q-input>
          </div>
          <!-- Options -->
          <div class="q-pa-xs">
            <@passwordCommons.logoutOtherSessions/>
          </div>
          <!-- Submit actions -->
          <div 
            class="row justify-center"
            :class="{ 'q-pa-sm': $q.screen.xs, 'q-pa-md': $q.screen.gt.xs }"
          >
          <#if isAppInitiatedAction??>
              <q-btn label="${msg('doCancel')}" type="submit" color="accent" outline value="true" />
              <div class="col-1" />
              <q-btn name="cancel-aia" label="${msg('doSubmit')}" type="submit" color="accent" :loading="updatedPasswordLoading" @click="updatedPasswordLoading = true" />
            </div>
          <#else>
            <q-btn label="${msg('doApply')}" type="submit" color="accent" :loading="updatedPasswordLoading" @click="updatedPasswordLoading = true" />
          </#if>
          </div>   
        </q-form>
      </div>
    </#if>
</@layout.registrationLayout>    