import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import BarList from './components/BarList';

$(function() {
  ReactDOM.render(
    <BarList />,
    document.getElementById('bars')
  );
});
