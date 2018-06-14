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
 * Service for the filter resource
 */
'use strict';

angular.module('matchminerUiApp')
    .factory('EmailsREST',
        ['$http', '$resource', 'ENV',
            function ($http, $resource, ENV) {
                return $resource(ENV.api.endpoint + '/email', {
                    'email_from': '@email_from',
                    'email_to': '@email_to',
                    'subject': "@subject",
                    'body': "@body",
                    'sent': false,
                }, {
                    'post': {
                        method: 'POST',
                        isArray: false
                    },
                });
            }
        ]);
