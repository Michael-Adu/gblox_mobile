import React from 'react';
import TestMain from "./components/TestMain";

import ThemeContextProvider from "./components/contexts/ThemeContext";
import CtxtP_SingletonManager from './components/contexts/Ctxt_SingletonManager';

import './App.css';

const App = () => {
  return (
    <ThemeContextProvider>
      <CtxtP_SingletonManager>

        <TestMain />
      </CtxtP_SingletonManager>
    </ThemeContextProvider>
  )
}

export default App;