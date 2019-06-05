import React , { Component } from 'react'

class LeaderBoard extends Component {
    render(){
        const { donations } = this.props;
        return (
            <div>
                <table className="table" >
                    <thead>
                        <tr>
                            <th>Donor</th>
                            <th>Ether Donated</th>
                            <th>Forever On The Block</th>
                        </tr>
                    </thead>
                    <tbody>
                        { donations.map((donation, index) => {
                            return (
                                <tr key={index} >
                                    <td>{donation.donorAddress}</td>
                                    <td>{donation.value}</td>
                                    <td>{donation.message}</td>
                                </tr>
                            )
                        })}
                    </tbody>
                </table>
            </div>

        )
    }
}

export default LeaderBoard;