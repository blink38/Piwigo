{combine_script id='jquery.chosen' load='footer' path='themes/default/js/plugins/chosen.jquery.min.js'}
{combine_css path="themes/default/js/plugins/chosen.css"}

{footer_script}{literal}
jQuery(document).ready(function() {
  jQuery(".chzn-select").chosen();

  function checkStatusOptions() {
    if (jQuery("input[name=status]:checked").val() == "private") {
      jQuery("#privateOptions, #applytoSubAction").show();
    }
    else {
      jQuery("#privateOptions, #applytoSubAction").hide();
    }
  }

  checkStatusOptions();
  jQuery("#selectStatus").change(function() {
    checkStatusOptions();
  });
});
{/literal}{/footer_script}

<div class="titrePage">
  <h2><span style="letter-spacing:0">{$CATEGORIES_NAV}</span> &#8250; {'Edit album'|@translate} {$TABSHEET_TITLE}</h2>
</div>

<form action="{$F_ACTION}" method="post" id="categoryPermissions">

<fieldset>
  <legend>{'Access type'|@translate}</legend>

  <p id="selectStatus">
    <label><input type="radio" name="status" value="public" {if not $private}checked="checked"{/if}> <strong>{'public'|@translate}</strong> : <em>{'any visitor can see this album'|@translate}</em></label>
    <br>
    <label><input type="radio" name="status" value="private" {if $private}checked="checked"{/if}> <strong>{'private'|@translate}</strong> : <em>{'visitors need to login and have the appropriate permissions to see this album'|@translate}</em></label>
  </p>
</fieldset>

<fieldset id="privateOptions">
  <legend>{'Groups and users'|@translate}</legend>

  <p>
    <strong>{'Permission granted for groups'|@translate}</strong>
    <br>
    <select data-placeholder="{'Select groups...'|@translate}" class="chzn-select" multiple style="width:700px;" name="groups[]">
      {html_options options=$groups selected=$groups_selected}
    </select>
  </p>

  <p>
    <strong>{'Permission granted for users'|@translate}</strong>
    <br>
    <select data-placeholder="{'Select users...'|@translate}" class="chzn-select" multiple style="width:700px;" name="users[]">
      {html_options options=$users selected=$users_selected}
    </select>
  </p>

{*
  <h4>{'Groups'|@translate}</h4>

  <fieldset>
    <legend>{'Permission granted'|@translate}</legend>
    <ul>
      {foreach from=$group_granted_ids item=id}
      <li><label><input type="checkbox" name="deny_groups[]" value="{$id}"> {$all_groups[$id]}</label></li>
      {/foreach}
    </ul>
    <input class="submit" type="submit" name="deny_groups_submit" value="{'Deny selected groups'|@translate}">
  </fieldset>

  <fieldset>
    <legend>{'Permission denied'|@translate}</legend>
    <ul>
      {foreach from=$group_denied_ids item=id}
      <li><label><input type="checkbox" name="grant_groups[]" value="{$id}"> {$all_groups[$id]}</label></li>
      {/foreach}
    </ul>
    <input class="submit" type="submit" name="grant_groups_submit" value="{'Grant selected groups'|@translate}">
    <label><input type="checkbox" name="apply_on_sub">{'Apply to sub-albums'|@translate}</label>
  </fieldset>

  <h4>{'Users'|@translate}</h4>

  <fieldset>
    <legend>{'Permission granted'|@translate}</legend>
    <ul>
      {foreach from=$user_granted_direct_ids item=id}
      <li><label><input type="checkbox" name="deny_users[]" value="{$id}"> {$all_users[$id]}</label></li>
      {/foreach}
    </ul>
    <input class="submit" type="submit" name="deny_users_submit" value="{'Deny selected users'|@translate}">
  </fieldset>

  <fieldset>
    <legend>{'Permission granted thanks to a group'|@translate}</legend>
    {if isset($user_granted_indirects) }
    <ul>
      {foreach from=$user_granted_indirects item=user_group}
      <li>{$user_group.USER} ({$user_group.GROUP})</li>
      {/foreach}
    </ul>
    {/if}
  </fieldset>

  <fieldset>
    <legend>{'Permission denied'|@translate}</legend>
    <ul>
      {foreach from=$user_denied_ids item=id}
      <li><label><input type="checkbox" name="grant_users[]" value="{$id}"> {$all_users[$id]}</label></li>
      {/foreach}
    </ul>
    <input class="submit" type="submit" name="grant_users_submit" value="{'Grant selected users'|@translate}">
    <label><input type="checkbox" name="apply_on_sub">{'Apply to sub-albums'|@translate}</label>
  </fieldset>
*}
</fieldset>

  <p style="margin:12px;text-align:left;">
    <input class="submit" type="submit" value="{'Save Settings'|@translate}" name="submit">
    <label id="applytoSubAction" style="display:none;"><input type="checkbox" name="apply_on_sub">{'Apply to sub-albums'|@translate}</label>
  </p>

<input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
</form>
