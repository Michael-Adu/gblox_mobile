import React from 'react'
import Example_Code_Menu from '.'
import Button from '../Button';

function Example_Code_Menu_Component() {

    return (
        <Example_Code_Menu>
            <div className="code-example">
                <div className="code-example-header">Police Flash Light</div>
                <div className="example-details">
                    <div>Difficulty: level 3</div>
                    <div>Blocks used:</div>
                    <div>Movement, Light Effects, Loops, Math</div>
                    This example is like the 'Random Walk' example in Mode 4, but this time the movements aren't so random! That's because the 'random number generator seed' causes the same sequence of random numbers to appear, depending on the range of integers given. Run this program multiple times to see that you will get the same sequence of actions every time.
                </div>

            </div>

        </Example_Code_Menu>
    )
}
export default {
    title: 'Example Code Menu',
    component: Example_Code_Menu
}

export const Example_Code_Default = () => Example_Code_Menu_Component();
