{**
 * templates/manager/reviewForms/reviewFormElements.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of review form elements.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.reviewFormElements"}
{include file="common/header.tpl"}
{/strip}
<script type="text/javascript">
{literal}
$(document).ready(function() { setupTableDND("#reviewFormElementsTable",
{/literal}
"{url op=moveReviewFormElement}"
{literal}
); });
{/literal}
</script>

<script type="text/javascript">
{literal}
<!--
function toggleChecked() {
	var elements = document.getElementById('reviewFormElements').elements;
	for (var i=0; i < elements.length; i++) {
		if (elements[i].name == 'copy[]') {
			elements[i].checked = !elements[i].checked;
		}
	}
}
// -->
{/literal}
</script>

	<ul class="nav nav-pills">
		<li class="nav-item "><a href="{url op="editReviewForm" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.edit"}</a></li>
		<li class="nav-item active"><a href="{url op="reviewFormElements" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.edit"}</a></li>

		<li class="nav-item"><a href="{url op="previewReviewForm" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.preview"}</a></li>
	</ul>
	<hr>

<div id="reviewFormElements">

<a class="btn btn-success pul-right" href="{url op="createReviewFormElement" path=$reviewFormId}">{translate key="manager.reviewFormElements.create"}</a>
<form id="reviewFormElements" action="{url op="copyReviewFormElement"}" method="post">

<table width="100%" class="table table-striped" id="reviewFormElementsTable">
<thead>
	<tr class="heading" valign="bottom">
		<th width="3%">&nbsp;</th>
		<th width="67%">{translate key="manager.reviewFormElements.question"}</th>
		<th width="30%">{translate key="common.action"}</th>
	</tr>
	</thead>
	<tbody>
{iterate from=reviewFormElements item=reviewFormElement name=reviewFormElements}
{assign var=reviewFormElementExists value=1}
	<tr valign="top" id="formelt-{$reviewFormElement->getId()}" class="data">
		<td><input type="checkbox" name="copy[]" value="{$reviewFormElement->getId()|escape}"/></td>
		<td class="drag">{$reviewFormElement->getLocalizedQuestion()|truncate:200:"..."}</td>
		<td class="nowrap">
			<a href="{url op="editReviewFormElement" path=$reviewFormElement->getReviewFormId()|to_array:$reviewFormElement->getId()}" class="btn btn-warning btn-xs">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteReviewFormElement" path=$reviewFormElement->getReviewFormId()|to_array:$reviewFormElement->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.reviewFormElements.confirmDelete"}')" class="btn btn-info btn-xs">{translate key="common.delete"}</a>&nbsp;|&nbsp;<a href="{url op="moveReviewFormElement" d=u id=$reviewFormElement->getId()}" class="action">&uarr;</a>&nbsp;<a href="{url op="moveReviewFormElement" d=d id=$reviewFormElement->getId()}" class="action">&darr;</a>
		</td>
	</tr>
  {if $reviewFormElements->eof()}
  
  {/if}
{/iterate}

{if $reviewFormElements->wasEmpty()}
	<tr>
		<td colspan="3" class="nodata">{translate key="manager.reviewFormElements.noneCreated"}</td>
	</tr>

{else}
	<tr>
		<td colspan="2" align="left">{page_info iterator=$reviewFormElements}</td>
		<td align="right">{page_links anchor="reviewFormElements" name="reviewFormElements" iterator=$reviewFormElements}</td>
	</tr>
{/if}
</tbody>
</table>

{if $reviewFormElementExists}
	<p>{translate key="manager.reviewFormElements.copyTo"}&nbsp;<select name="targetReviewForm" class="selectMenu" size="1">{html_options options=$unusedReviewFormTitles}</select>&nbsp;<input type="submit" value="{translate key="common.copy"}" class="button defaultButton"/>&nbsp;<input type="button" value="{translate key="common.selectAll"}" class="button" onclick="toggleChecked()" /></p>
{/if}
</form>

<br />

</div>
{include file="common/footer.tpl"}

