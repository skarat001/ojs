{**
	* templates/author/submission/authorFees.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Display of author fees and payment information
	*
	*}
	<div id="authorFees">
		<h3>{translate key="payment.authorFees"}</h3>
	<div class="row" >

			<div class="col-md-3 ">
				<h5>

		{if $currentJournal->getSetting('submissionFeeEnabled')}

		{$currentJournal->getLocalizedSetting('submissionFeeName')|escape}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{if $submissionPayment}
		{translate key="payment.paid"} {$submissionPayment->getTimestamp()|date_format:$datetimeFormatLong}
		{else}
		
		{$currentJournal->getSetting('submissionFee')|string_format:"%.2f"} {$currentJournal->getSetting('currency')}<
		<a class="action" href="{url op="paySubmissionFee" path=$submission->getId()}">{translate key="payment.payNow"}</a>
		{/if}
				</strong>
				</h5>
			</div>
		</div>

		{/if}

			<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{if $currentJournal->getSetting('fastTrackFeeEnabled')}

		{$currentJournal->getLocalizedSetting('fastTrackFeeName')|escape}:
			</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong> 
		{if $fastTrackPayment}
			
		{translate key="payment.paid"} {$fastTrackPayment->getTimestamp()|date_format:$datetimeFormatLong}
		{else}
		{$currentJournal->getSetting('fastTrackFee')|string_format:"%.2f"} {$currentJournal->getSetting('currency')}
		<a class="action" href="{url op="payFastTrackFee" path=$submission->getId()}">{translate key="payment.payNow"}</a>
		{/if}

		{/if}
						</strong>
				</h5>
			</div>
		</div>

			<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{if $currentJournal->getSetting('publicationFeeEnabled')}

		{$currentJournal->getLocalizedSetting('publicationFeeName')|escape}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
					
		{if $publicationPayment}
		{translate key="payment.paid"} {$publicationPayment->getTimestamp()|date_format:$datetimeFormatLong}

		{else}
		{$currentJournal->getSetting('publicationFee')|string_format:"%.2f"} {$currentJournal->getSetting('currency')}
		<a class="action" href="{url op="payPublicationFee" path=$submission->getId()}">{translate key="payment.payNow"}</a>
		{/if}

		{/if}
				</strong>
				</h5>
			</div>
		</div>
	</div>
