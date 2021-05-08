import * as React from "react"
import userEvent from "@testing-library/user-event";

class ToDo extends React.Component {
    state = {
        task: "",
        count: 0
    }
    handleOnClick = (event) => {
        let count = this.state.count;
        this.setState({
            count: ++count
        })
    }
    handleOnChange=(event)=>{
        const task=event.target.value;
        this.setState({task})
    }
    addTaskItem=(event)=>{
        const list=document.getElementById("show-task").appendChild(document.createElement("li"))
        list.appendChild(document.createTextNode(this.state.task));
    }
    render() {

        return (
            <div>
                <input type={"text"} onChange={this.handleOnChange}/>
                <button onClick={() => {
                    this.handleOnClick()
                    this.addTaskItem()
                }}>
                    Add</button>
                <div>
                    <h1>To Do Task {this.state.count}</h1>
                    <ul id={"show-task"}>

                    </ul>
                </div>
            </div>
        )
    }
}

export default ToDo