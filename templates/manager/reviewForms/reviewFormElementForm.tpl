{**
	* templates/manager/reviewForms/reviewFormElementForm.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Form to create/modify a review form element.
	*
	*}
	{strip}
	{assign var="pageId" value="manager.reviewFormElements.reviewFormElementForm"}
	{assign var="pageCrumbTitle" value=$pageTitle}
	{include file="common/header.tpl"}
	{/strip}

	<script type="text/javascript">
		{literal}
		<!--
		function togglePossibleResponses(newValue, multipleResponsesElementTypesString) {
			if (multipleResponsesElementTypesString.indexOf(';'+newValue+';') != -1) {
				document.getElementById('reviewFormElementForm').addResponse.disabled=false;
			} else {
				if (document.getElementById('reviewFormElementForm').addResponse.disabled == false) {
					alert({/literal}'{translate|escape:"jsparam" key="manager.reviewFormElement.changeType"}'{literal});
				}
				document.getElementById('reviewFormElementForm').addResponse.disabled=true;
			}
		}
// -->
{/literal}
</script>

<br/>
<form id="reviewFormElementForm" method="post" action="{url op="updateReviewFormElement" anchor="possibleResponses"}" class="form-horizontal">
	<input type="hidden" name="reviewFormId" value="{$reviewFormId}"/>
	<input type="hidden" name="reviewFormElementId" value="{$reviewFormElementId}"/>

	{include file="common/formErrors.tpl"}


	{if count($formLocales) > 1}
	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="formLocale" key="form.formLanguage"}
		</div>
		<div class="col-md-7 col-sm-7">

			{if $reviewFormElementId}{url|assign:"reviewFormElementFormUrl" op="editReviewFormElement" path=$reviewFormId|to_array:$reviewFormElementId escape=false}
			{else}{url|assign:"reviewFormElementFormUrl" op="createReviewFormElement" path=$reviewFormId escape=false}
			{/if}
			{form_language_chooser form="reviewFormElementForm" url=$reviewFormElementFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</div>
	</div>
	{/if}
	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="question" required="true" key="manager.reviewFormElements.question"}
		</div>
		<div class="col-md-7 col-sm-7">
			<textarea name="question[{$formLocale|escape}]" rows="4" cols="40" id="question" class="form-control">{$question[$formLocale]|escape}</textarea>

			<label>
				<input type="checkbox" name="required" id="required" value="1" {if $required}checked="checked"{/if} />
				{translate key="manager.reviewFormElements.required"}
			</label>
			<label>
				<input type="checkbox" name="included" id="included" value="1" {if $included}checked="checked"{/if} />
				{translate key="manager.reviewFormElements.included"}
			</label>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="elementType" required="true" key="manager.reviewFormElements.elementType"}
		</div>
		<div class="col-md-7 col-sm-7">
			<select name="elementType" id="elementType" class="selectMenu" size="1" onchange="togglePossibleResponses(this.options[this.selectedIndex].value, '{$multipleResponsesElementTypesString}')">{html_options_translate options=$reviewFormElementTypeOptions selected=$elementType}</select>
	
	<input type="submit" name="addResponse" value="{translate key="manager.reviewFormElements.addResponseItem"}" class="btn btn-success" {if not in_array($elementType, $multipleResponsesElementTypes)}disabled="disabled"{/if}/>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-offset-3 col-sm-offset-3">
			{foreach name=responses from=$possibleResponses[$formLocale] key=responseId item=responseItem}
			{if !$notFirstResponseItem}
			{assign var=notFirstResponseItem value=1}
			<div class="row">
				<div class="col-md-2">
					{translate key="common.order"}
				</div>
				<div class="col-md-7">
					{translate key="manager.reviewFormElements.possibleResponse"}
				</div>
			</div>
			{/if}
			<div class="row">
				<div class="col-md-2">
					<input type="text" name="possibleResponses[{$formLocale|escape}][{$responseId|escape}][order]" value="{$responseItem.order|escape}" size="3" maxlength="2" class="form-control" />
				</div>
				<div class="col-md-7">
					<textarea name="possibleResponses[{$formLocale|escape}][{$responseId|escape}][content]" id="possibleResponses-{$responseId}" rows="3" col="35" class="form-control">{$responseItem.content|escape}</textarea>
				</div>
				<div class="col-md-3">
					<input type="submit" name="delResponse[{$responseId}]" value="{translate key="common.delete"}" class="btn btn-danger btn-xs" />
				</div>
			</div>
			

			{/foreach}

			{if $notFirstResponseItem}
	</div>
	</div>
			{/if}
	
	<br/>

</td>
</tr>
</table>
<div class="form-group">
<div class="col-md-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="reviewFormElements" path=$reviewFormId escape=false}'" /></p>
</div>
</div>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{include file="common/footer.tpl"}

