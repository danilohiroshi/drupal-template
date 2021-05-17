
window._ = require('lodash');

try {
    if (!window.jQuery) {
        window.$ = window.jQuery = require('jquery');
    }

    require('bootstrap');
} catch (e) {}

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

import 'bootstrap';
import moment from 'moment';
import aos from 'aos';
aos.init();


