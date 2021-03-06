/*
 * Copyright (c) 2017. Dana-Farber Cancer Institute. All rights reserved.
 *
 *  Licensed under the GNU Affero General Public License, Version 3.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *   
 * See the file LICENSE in the root of this repository.
 *
 * Contributing authors:
 * - berndvdveen
 *  
 */

/**
 * REST Service for retrieving the trial belonging to matches
 */
'use strict';

angular.module('matchminerUiApp')
	.factory('TrialMatchREST',
		['$resource', 'ENV',
			function ($resource, ENV) {
				return $resource(ENV.api.endpoint, {
					id: "@id",
					where: "@query"
				}, {
					'query': {
						method: 'GET',
						url: ENV.api.endpoint + '/trial_match:query',
						isArray: false
					}
				});
			}
		]);
