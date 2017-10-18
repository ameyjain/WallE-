import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';
import usersReducer from './user_reducer';
import authReducer from './auth_reducer';
import generalInfoReducer from './general_info_reducer';

const rootReducer = combineReducers({
  auth: authReducer,
  users: usersReducer,
  general_info: generalInfoReducer,
});

export default rootReducer;
