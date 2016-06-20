{**
 * templates/sectionEditor/submission/authorFees.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display of author fees and payment information
 *
 *}
<div id="authorFees">
<h3>{translate key="manager.payment.authorFees"}</h3>

{if $currentJournal->getSetting('submissionFeeEnabled')}
		<div class="row">
			<div class="col-md-3">
				<strong> 
{$currentJournal->getLocalizedSetting('submissionFeeName')|escape}
				</strong>
			</div>
			<div class="col-md-6"> 

	{if $submissionPayment}

		{translate key="payment.paid"} {$submissionPayment->getTimestamp()|date_format:$datetimeFormatLong}
	{else} 
		<a  href="{url op="waiveSubmissionFee" path=$submission->getId() markAsPaid=true}" class="btn btn-success btn-xs mgn">{translate key="payment.paymentReceived"}</a>&nbsp;|&nbsp;<a  href="{url op="waiveSubmissionFee" path=$submission->getId()}" class="btn btn-warning btn-xs mgn">{translate key="payment.waive"}</a>
	{/if}
	</div>
		</div>
{/if}
{if $currentJournal->getSetting('fastTrackFeeEnabled')}
			<div class="row">
			<div class="col-md-3">
				<strong>
	{$currentJournal->getLocalizedSetting('fastTrackFeeName')|escape}
				</strong>
			</div>
			<div class="col-md-6"> 
	{if $fastTrackPayment}

		{translate key="payment.paid"} {$fastTrackPayment->getTimestamp()|date_format:$datetimeFormatLong}

	{else}

		<a class="btn btn-success btn-xs mgn" href="{url op="waiveFastTrackFee" path=$submission->getId() markAsPaid=true}" >{translate key="payment.paymentReceived"}</a>&nbsp;|&nbsp;<a class="btn btn-warning btn-xs mgn" href="{url op="waiveFastTrackFee" path=$submission->getId()}">{translate key="payment.waive"}</a>		
	{/if}
			</div>
		</div>	
{/if}
{if $currentJournal->getSetting('publicationFeeEnabled')}
			<div class="row">
			<div class="col-md-3">
				<strong>
	{$currentJournal->getLocalizedSetting('publicationFeeName')|escape}
				</strong>
			</div>
			<div class="col-md-6"> 
	{if $publicationPayment}
		{translate key="payment.paid"} {$publicationPayment->getTimestamp()|date_format:$datetimeFormatLong}
	{else}
		<a class="btn btn-success btn-xs mgn" href="{url op="waivePublicationFee" path=$submission->getId() markAsPaid=true}">{translate key="payment.paymentReceived"}</a>&nbsp;|&nbsp;<a class="btn btn-warning btn-xs mgn" href="{url op="waivePublicationFee" path=$submission->getId()}">{translate key="payment.waive"}</a>		
	{/if}
			</div>
		</div>
{/if}

</div>
