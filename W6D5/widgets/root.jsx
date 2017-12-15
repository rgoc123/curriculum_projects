import React from 'react';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

const tabProp = [{title: 'first', content: "i am the first"},{title: "second", content: "i am the second"},{title: "third", content: "i am the third"}];

const Root = () => {
  return(
    <div>
      <Clock/>
      <Tabs tabs={ tabProp }/>
      <Weather/>
    </div>
  );
};


export default Root;
