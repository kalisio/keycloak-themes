<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <!--
      Form section
    -->
    <#if section = "form">
        <!-- Title -->
        <div class="text-subtitle1 text-center" :class="{ 'q-pa-xs': $q.screen.xs, 'q-pa-sm': $q.screen.gt.xs }">
            ${msg("confirmLinkIdpTitle")}
        </div>
        <!-- Content -->
        <div class="full-width">
            <p class="row justify-center">${message.summary}</p>
            <q-form class="column" action="${url.loginAction}" method="post">
                <input type="hidden" name="submitAction" id="submitAction" :value="submitAction" />
                <q-btn outline class="row q-my-sm" type="submit" label="${msg("confirmLinkIdpReviewProfile")}" color="primary" @click="submitAction='updateProfile'"></q-btn>
                <q-btn class="row q-my-sm" type="submit" label="${msg("confirmLinkIdpContinue", idpDisplayName)}" color="primary" @click="submitAction='linkAccount'"></q-btn>
            </q-form>
        </div>
    </#if>
</@layout.registrationLayout>
