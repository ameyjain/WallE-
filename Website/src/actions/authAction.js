import axios from 'axios';
import { browserHistory } from 'react-router';
import { API_URL, errorHandler, queryString } from './index';
import { AUTH_USER, AUTH_ERROR, UNAUTH_USER } from './types';

//= ===============================
// Authentication actions
//= ===============================

export function login({ email, password, remember_me }) {
  return function(dispatch) {
    axios.post(`${API_URL}/email-login.php`,
                        queryString.stringify({
                            user_email: email,
                            user_password: password
                        }))
    .then((response) => {
      dispatch({
        type: AUTH_USER,
        payload: response.data,
      });
      browserHistory.push('/dashboard');
    })
    .catch((error) => {
      errorHandler(dispatch, error.response, AUTH_ERROR)
    });
  }
}

export function register(props) {
  return function(dispatch) {
    axios.post(`${API_URL}/email-signup.php`,
                          queryString.stringify({
                            first_name: props.first_name,
                            last_name: props.last_name,
                            email: props.email,
                            password: props.password,
                          }))
    .then((response) => {
      dispatch({
        type: AUTH_USER,
        payload: response.data,
      });
      browserHistory.push('/dashboard');
    })
    .catch((error) => {
      errorHandler(dispatch, error.response, AUTH_ERROR)
    });
  }
}

export function logoutUser(error) {
  return function (dispatch) {
    dispatch({
      type: UNAUTH_USER,
      payload: 'You have been logged out',
    });
    browserHistory.push('/login');
  };
}
