import React,{Component} from 'react'
import './ExpenseTracker.css'
class ExpenseTracker extends Component{
    state={
        description:"",
        amount:"",
        count:0,
        income:0,
        expense:0,
        length:0,
        transactionList:[],
    }
    getBalance(){
        let bal=0;
        bal+=parseInt(this.state.income - this.state.expense);
        return bal;
    };
    setDescription=(e)=>{
        this.setState({
            description:e.target.value
        })
    };
    setAmount=(e)=> {
        this.setState({
            amount: e.target.value
        })
    };
    makeTransaction=()=>{
        let newTransaction={
            id:this.state.count,
            transactionDescription: this.state.description,
            transactionAmount: this.state.amount,
        }
        let tempTransactionList=[...this.state.transactionList];
        tempTransactionList.unshift(newTransaction);
        this.setState({transactionList:[...tempTransactionList]});
    }
    Add=(e)=> {
        //show Error Message
        if (this.state.description === "") {
            alert("Error! Enter a valid description!");
            return;
        };
        if (this.state.amount === "" || parseInt(this.state.amount) === 0) {
            alert("Error! Enter a valid amount!");
            return;
        };
        this.setState({count:this.state.count+1});
        this.setState({length:this.state.length+1});
        this.setState({message: ""});
        if(this.state.amount>0)
            this.setState({income: this.state.income + Math.abs(this.state.amount)})
        else
            this.setState({expense: this.state.expense + Math.abs(this.state.amount)})

        this.makeTransaction();
    }
    delete=(id)=>{
        let tempList=[];
        this.state.transactionList.map((transaction)=> {
            if(transaction.id===id)
            {
                if(transaction.transactionAmount>=0)
                    this.setState({income:this.state.income-transaction.transactionAmount});
                else
                    this.setState({expense:this.state.expense-Math.abs(transaction.transactionAmount)});
            }
            else
                tempList=[...tempList,transaction];
        });
        this.setState({transactionList: tempList});
        this.setState({length:--this.state.length});
    }
    render() {
        return (
            <div className={"main"}>
                <div className={"header"}>
                    <h1>Expense Tracker</h1>
                    <h2>Balance&nbsp;&nbsp;:&nbsp;&nbsp;${this.getBalance()}</h2>
                </div>
                <div className={"total"}>
                    <div>Income<br/>${this.state.income}</div>
                    <div className={"expense"}>Expense<br/>${this.state.expense}</div>
                </div>
                <div>
                    <h3>Transaction History</h3>
                    <hr/>
                    {
                        (this.state.length <= 0) ? "No transactions added yet!" : this.state.transactionList.map((item) =>{
                            return (
                                <div className={`historyItems ${item.transactionAmount >= 0 ? "historyIncome" : "historyExpense"}`}>
                                    <span>{item.transactionDescription}</span>
                                    <span>${item.transactionAmount}</span>
                                    <button className={`${item.transactionAmount >= 0 ? "deleteBtnIncome" : "deleteBtnExpense"}`}
                                          onClick={() => {this.delete(item.id)}}
                                    >X</button>
                                </div>
                            )
                        })
                    }
                </div>
                <div>
                    <h3>Add Transaction</h3>
                    <hr/>
                    <label htmlFor="desc">Description:</label>
                    <input type="text" placeholder="Enter description" onChange={this.setDescription}/>
                    <label htmlFor="amount">Amount:</label>
                    <input type="number" placeholder="-ive -> expense, +ive -> income" onChange={this.setAmount}/>
                    <button className="btn" onClick={this.Add}>Add</button>
                </div>
            </div>
        )
    }
}
export default ExpenseTracker;