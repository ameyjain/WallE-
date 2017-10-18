import axios from 'axios';
import { API_URL, errorHandler, queryString } from './index';
import { FETCH_GENERAL_INFO } from './types';

//= ===============================
// Global actions
//= ===============================
export function fetchGeneralInfo() {
  return function (dispatch) {
    axios.post(`${API_URL}/fetch-general-info.php`,
      queryString.stringify({
        user_token: SessionHelper.getToken()
      }))
    .then((response) => {
      dispatch({
        type: FETCH_GENERAL_INFO,
        payload: response,
      });
    })
    .catch((error) => {
      errorHandler(dispatch, error.response, API_ERROR)
    });
    };
}
