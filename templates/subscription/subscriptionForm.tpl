{**
 * templates/subscription/subscriptionForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common subscription fields
 *
 *}

<script type="text/javascript">
<!--
{literal}
function chooseEndDate() {
	var lengths = {{/literal}
		{* Build up an array of typeId => Duration in Javascript land *}
		{foreach from=$subscriptionTypes item=subscriptionType}
			{if !$subscriptionType->getNonExpiring()}
				{$subscriptionType->getTypeId()}: "{$subscriptionType->getDuration()|escape:"javascript"}",
			{/if}
		{/foreach}
	{literal}};

	var subscriptionForm = document.getElementById('subscriptionForm');
	var selectedTypeIndex = subscriptionForm.typeId.selectedIndex;
	var selectedTypeId = subscriptionForm.typeId.options[selectedTypeIndex].value;

	if (typeof(lengths[selectedTypeId]) != "undefined") {
		var duration = lengths[selectedTypeId];
		var dateStart = new Date(
			subscriptionForm.dateStartYear.options[subscriptionForm.dateStartYear.selectedIndex].value,
			subscriptionForm.dateStartMonth.options[subscriptionForm.dateStartMonth.selectedIndex].value - 1,
			subscriptionForm.dateStartDay.options[subscriptionForm.dateStartDay.selectedIndex].value,
			0, 0, 0
		);
		var dateEnd = dateStart;

		var months = duration % 12;
		var years = Math.floor(duration / 12);

		if (months + dateStart.getMonth() > 11) {
			dateEnd.setFullYear(dateStart.getFullYear()+1);
		}
		dateEnd.setFullYear(dateEnd.getFullYear() + years);
		dateEnd.setMonth((dateStart.getMonth() + months) % 12);

		// dateEnd now contains the calculated date of the subscription expiry.
		subscriptionForm.dateEndDay.selectedIndex = dateEnd.getDate() - 1;
		subscriptionForm.dateEndMonth.selectedIndex = dateEnd.getMonth();

		var i;
		for (i=0; i < subscriptionForm.dateEndYear.length; i++) {
			if (subscriptionForm.dateEndYear.options[i].value == dateEnd.getFullYear()) {
				subscriptionForm.dateEndYear.selectedIndex = i;
				break;
			}
		}
	}
}
{/literal}
// -->
</script>
<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="status" required="true" key="manager.subscriptions.form.status"}
</div>
<div class="col-md-6">
<select name="status" id="status" class="form-control">
	{html_options_translate options=$validStatus selected=$status}
	</select>
	</div>
		</div>
		<div class="form-group">
<div class="col-md-3 control-label">
	{fieldLabel name="typeId" required="true" key="manager.subscriptions.form.typeId"}
</div>
<div class="col-md-6">
	<select name="typeId" id="typeId" class="form-control" onchange="chooseEndDate()">
		{foreach from=$subscriptionTypes item=subscriptionType}
			<option value="{$subscriptionType->getTypeId()}"{if $typeId == $subscriptionType->getTypeId()} selected="selected"{/if}>{$subscriptionType->getSummaryString()|escape}</option>
		{/foreach}
		</select>
		</div>
		</div>
<div class="form-group">
<div class="col-md-3 control-label">
	{fieldLabel name="dateStart" key="manager.subscriptions.form.dateStart"}
</div>
<div class="col-md-6">
	{html_select_date prefix="dateStart" all_extra="class=\"selectMenu\" onchange=\"chooseEndDate()\"" start_year="$yearOffsetPast" end_year="$yearOffsetFuture" time="$dateStart"}
	</div>
		</div>

		<div class="form-group">
<div class="col-md-3 control-label">
	{fieldLabel name="dateEnd" key="manager.subscriptions.form.dateEnd"}
</div>
<div class="col-md-6">
		{html_select_date prefix="dateEnd" start_year="$yearOffsetPast" all_extra="class=\"selectMenu\"" end_year="$yearOffsetFuture" time="$dateEnd"}
		<input type="hidden" name="dateEndHour" value="23" />
		<input type="hidden" name="dateEndMinute" value="59" />
		<input type="hidden" name="dateEndSecond" value="59" />

	</div>
		</div>

		<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="membership" key="manager.subscriptions.form.membership"}
</div>
<div class="col-md-6">
		<input type="text" name="membership" value="{$membership|escape}" id="membership" size="30" maxlength="40" class="form-control" />
		</div>
		</div>

		<div class="form-group">
<div class="col-md-3 control-label">
	{fieldLabel name="referenceNumber" key="manager.subscriptions.form.referenceNumber"}
</div>
<div class="col-md-6">
		<input type="text" name="referenceNumber" value="{$referenceNumber|escape}" id="referenceNumber" size="30" maxlength="40" class="form-control" />
	</div>
		</div>

{if $subscriptionId}
	{if is_a($subscription,'InstitutionalSubscription')}
		{assign var=subscriptionClass value="institutional"}
	{else}
		{assign var=subscriptionClass value="individual"}
	{/if}
	
	<div class="form-group">
<div class="col-md-3 control-label">
	{translate key="manager.subscriptions.form.dateRemindedBefore"}
</div>
<div class="col-md-6">
			{$dateRemindedBefore|date_format:$dateFormatShort|default:"&mdash;"}
			&nbsp;
			<a href="{url op="resetDateReminded" type="before" path=$subscriptionClass|to_array:$subscriptionId}" class="btn btn-link">{translate key="common.reset"}</a>
			</div>
		</div>

		<div class="form-group">
<div class="col-md-3 control-label">
		{translate key="manager.subscriptions.form.dateRemindedAfter"}
</div>
<div class="col-md-6">
			{$dateRemindedAfter|date_format:$dateFormatShort|default:"&mdash;"}
			&nbsp;
			<a href="{url op="resetDateReminded" type="after" path=$subscriptionClass|to_array:$subscriptionId}" class="btn btn-link">{translate key="common.reset"}</a>
			</div>
		</div>
	
{/if}
