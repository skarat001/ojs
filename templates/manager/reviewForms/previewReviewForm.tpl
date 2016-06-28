{**
 * templates/manager/reviewForms/previewReviewForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Preview of a review form.
 *
 *}
{strip}
{assign var="pageId" value="manager.reviewFormElements.previewReviewForm"}
{assign var="pageCrumbTitle" value=$pageTitle}
{include file="common/header.tpl"}
{/strip}

{assign var=reviewFormId value=$reviewForm->getId()}
{if $completeCounts[$reviewFormId]==0 && $incompleteCounts[$reviewFormId]==0}
	{assign var=canEdit value=1}
{else}
	{assign var=canEdit value=0}
{/if}

{if $canEdit}
	<ul class="nav nav-pills">
		<li class="nav-item "><a href="{url op="editReviewForm" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.edit"}</a></li>
		<li class="nav-item"><a href="{url op="reviewFormElements" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.edit"}</a></li>

		<li class="nav-item active"><a href="{url op="previewReviewForm" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.preview"}</a></li>
	</ul>
	<hr>
{/if}

<br/>

<h3>{$reviewForm->getLocalizedTitle()}</h3>
<p>{$reviewForm->getLocalizedDescription()}</p>
<br/>
{foreach from=$reviewFormElements name=reviewFormElements item=reviewFormElement}
<div class="row">
<div class="col-md-3 col-sm-3">
	{$reviewFormElement->getLocalizedQuestion()}{if $reviewFormElement->getRequired()}*{/if}
	</div>
	<div class="col-md-7 col-sm-7">
		{if $reviewFormElement->getElementType() == REVIEW_FORM_ELEMENT_TYPE_SMALL_TEXT_FIELD}
			<input type="text" size="10" maxlength="40" class="form-control" />
		{elseif $reviewFormElement->getElementType() == REVIEW_FORM_ELEMENT_TYPE_TEXT_FIELD}
			<input type="text" size="40" maxlength="120" class="form-control" />
		{elseif $reviewFormElement->getElementType() == REVIEW_FORM_ELEMENT_TYPE_TEXTAREA}
			<textarea rows="4" cols="40" class="textArea"></textarea>
		{elseif $reviewFormElement->getElementType() == REVIEW_FORM_ELEMENT_TYPE_CHECKBOXES}
			{assign var=possibleResponses value=$reviewFormElement->getLocalizedPossibleResponses()}
			{foreach name=responses from=$possibleResponses key=responseId item=responseItem}
				<input id="check-{$responseId|escape}" type="checkbox"/>
				<label for="check-{$responseId|escape}">{$responseItem.content}</label>
				<br/>
			{/foreach}
		{elseif $reviewFormElement->getElementType() == REVIEW_FORM_ELEMENT_TYPE_RADIO_BUTTONS}
			{assign var=possibleResponses value=$reviewFormElement->getLocalizedPossibleResponses()}
			{foreach name=responses from=$possibleResponses key=responseId item=responseItem}
				<input id="radio-{$responseId|escape}" name="{$reviewFormElement->getId()}" type="radio"/>
				<label for="radio-{$responseId|escape}">{$responseItem.content}</label>
				<br/>
			{/foreach}
		{elseif $reviewFormElement->getElementType() == REVIEW_FORM_ELEMENT_TYPE_DROP_DOWN_BOX}
			<select size="1" class="form-control">
				{assign var=possibleResponses value=$reviewFormElement->getLocalizedPossibleResponses()}
				{foreach name=responses from=$possibleResponses key=responseId item=responseItem}
					<option>{$responseItem.content}</option>
				{/foreach}
			</select>
		{/if}
</div>
</div>
{/foreach}

<br/>

<form id="previewReviewForm" method="post" action="{if !$canEdit}{url op="reviewForms"}{else}{url op="editReviewForm" path=$reviewFormId}{/if}">
	<p><input type="submit" value="{translate key="common.close"}" class="btn btn-warning" /></p>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
{include file="common/footer.tpl"}

