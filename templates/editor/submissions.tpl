{**
 * templates/editor/submissions.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Editor submissions page(s).
 *
 *}
{strip}
{strip}
{assign var="pageTitle" value="common.queue.long.$pageToDisplay"}
{url|assign:"currentUrl" page="editor"}
{include file="common/header.tpl"}
{/strip}
{/strip}




<ul class="nav nav-pills">
	<li class="nav-item {if $pageToDisplay == "submissionsUnassigned"} active {/if}"><a href="{url op="submissions" path="submissionsUnassigned"}" class="nav-link">{translate key="common.queue.short.submissionsUnassigned"}</a></li>
	<li class="nav-item {if $pageToDisplay == "submissionsInReview"} active {/if}"><a href="{url op="submissions" path="submissionsInReview"}" class="nav-link">{translate key="common.queue.short.submissionsInReview"}</a></li>
	<li class="nav-item {if $pageToDisplay == "submissionsInEditing"} active {/if}"><a href="{url op="submissions" path="submissionsInEditing"}" class="nav-link">{translate key="common.queue.short.submissionsInEditing"}</a></li>
	<li class="nav-item {if $pageToDisplay == "submissionsArchives"} active {/if}"><a href="{url op="submissions" path="submissionsArchives"}" class="nav-link">{translate key="common.queue.short.submissionsArchives"}</a></li>
</ul>
<hr>

<form action="#" class="form-inline">
<div class="form-group">


	{translate key="editor.submissions.assignedTo"}: 


	<select name="filterEditor" onchange="location.href='{url|escape:"javascript" path=$pageToDisplay searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth dateSearchField=$dateSearchField filterEditor="EDITOR" escape=false}'.replace('EDITOR', this.options[this.selectedIndex].value)" size="1" class="form-control">{html_options options=$editorOptions selected=$filterEditor}</select>

	 </div>
	 <div class="form-group">

	{translate key="editor.submissions.inSection"}:

	 <select name="filterSection" onchange="location.href='{url|escape:"javascript" path=$pageToDisplay searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth dateSearchField=$dateSearchField filterSection="SECTION_ID" escape=false}'.replace('SECTION_ID', this.options[this.selectedIndex].value)" size="1" class="form-control">{html_options options=$sectionOptions selected=$filterSection}</select>
	 
	 </div>
	 

</form>

{if !$dateFrom}
{assign var="dateFrom" value="--"}
{/if}

{if !$dateTo}
{assign var="dateTo" value="--"}
{/if}

<script type="text/javascript">
{literal}
<!--
function sortSearch(heading, direction) {
	var submitForm = document.getElementById('submit');
	submitForm.sort.value = heading;
	submitForm.sortDirection.value = direction;
	submitForm.submit();
}
// -->
{/literal}
</script>



<form method="post" id="submit" action="{url op="submissions" path=$pageToDisplay}" class="form-horizontal">
	<input type="hidden" name="sort" value="id"/>
	<input type="hidden" name="sortDirection" value="ASC"/>
	<div class="form-group">
<div class="col-md-2">
	<select name="searchField" size="1" class="form-control">
		{html_options_translate options=$fieldOptions selected=$searchField}
	</select>
</div>
<div class="col-md-2">
	
	<select name="searchMatch" size="1" class="form-control">
		<option value="contains"{if $searchMatch == 'contains'} selected="selected"{/if}>{translate key="form.contains"}</option>
		<option value="is"{if $searchMatch == 'is'} selected="selected"{/if}>{translate key="form.is"}</option>
		<option value="startsWith"{if $searchMatch == 'startsWith'} selected="selected"{/if}>{translate key="form.startsWith"}</option>
	
	</select>
	</div>
	<div class="col-md-4">
	<input type="text" size="15" name="search" class="form-control" value="{$search|escape}" />
</div>
	</div>

	<div class="form-group">
	<div class="col-md-3">
	<select name="dateSearchField" size="1" class="form-control">
		{html_options_translate options=$dateFieldOptions selected=$dateSearchField}
	</select>
	</div>
<div class="col-md-14">
	{translate key="common.between"}
	
	{html_select_date prefix="dateFrom" time=$dateFrom all_extra="class=\"\"" year_empty="" month_empty="" day_empty="" start_year="-5" end_year="+1"}
	</div>
	
	<div class="col-md-4 ">
	{translate key="common.and"}
	
	{html_select_date prefix="dateTo" time=$dateTo all_extra="class=\"\"" year_empty="" month_empty="" day_empty="" start_year="-5" end_year="+1"}
	</div>
	<input type="hidden" name="dateToHour" value="23" />
	<input type="hidden" name="dateToMinute" value="59" />
	<input type="hidden" name="dateToSecond" value="59" />
	
</div>
	</div>
	<input type="submit" value="{translate key="common.search"}" class="btn btn-info" />
</form>
<hr>


{include file="editor/$pageToDisplay.tpl"}

{if ($pageToDisplay == "submissionsInReview")}
<br />
<div id="notes">
<h4>{translate key="common.notes"}</h4>
{translate key="editor.submissionReview.notes"}
</div>
{elseif ($pageToDisplay == "submissionsInEditing")}
<br />
<div id="notes">
<h4>{translate key="common.notes"}</h4>
{translate key="editor.submissionEditing.notes"}
</div>
{/if}

{include file="common/footer.tpl"}

