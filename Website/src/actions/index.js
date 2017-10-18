import axios from 'axios';
import { STATIC_ERROR, API_ERROR } from './types';

export const API_URL = 'http://dev.selfrecruitment.apppartner.com/SelfRecruitment/scripts';

export const queryString = require('query-string');


//= ===============================
// Utility actions
//= ===============================

export function errorHandler(dispatch, error, type) {
  var errorMessage = "uknown_error_no_message";
  if(error) {
    errorMessage = error.response ? error.response.data : error;
  }

  dispatch({
    type: type,
    payload: errorMessage,
  });
}

//= ===============================
// Static Content actions
//= ===============================
