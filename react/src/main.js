import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Bar from './components/Bar';

$(function() {
  reactDOM.render(
    <Bar />,
    document.getElementById('app')
  );
});
