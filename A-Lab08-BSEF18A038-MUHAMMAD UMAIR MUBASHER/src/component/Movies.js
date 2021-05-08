import React, {Component} from 'react'
import 'react-bootstrap'
const genres = ["Action", "Horror", "Sci-fi", "Drama", "Adventure"];
const moviesList = [
    {
        title: "Avengers Endgame",
        year: 2019,
        genre: "Action",
        cast: [
            {name: "Robert Downey Jr", role: "Iron Man"},
            {name: "Chris Hemsworth", role: "Thor"},
            {name: "Mark Ruffalo", role: "Hulk"},
        ],
    }
    ,
    {
        title: "Inception",
        year: 2010,
        genre: "Sci-fi",
    },
    {
        title: "The Imitation Game",
        year: 2014,
        genre: "Drama",
    },
    {
        title: "The Conjuring",
        year: 2013,
        genre: "Horror",
    },
    {
        title: "John Wick",
        year: 2014,
        genre: "Action",
    },
    {
        title: "Spider Man Homecoming",
        year: 2017,
        genre: "Action",
    },
    {
        title: "Inception",
        year: 2010,
        genre: "Sci-fi",
    },
    {
        title: "The Matrix",
        genre: "Sci-fi",
        year: 1999,
    },
];

class Movies extends Component {
    state = {
        movies: moviesList,
        filterMovies: []
    };

    handleOnClick = (event) =>{
        const byOrigin = event.target.value;
        let filterMovies = [];
        if (event.target.value === "All") {
            filterMovies =this.state.movies;
        } else {
            filterMovies = this.state.movies.filter(movies => movies.genre === byOrigin);
        }
        this.setState({filterMovies});
    }
//On component mount copy original array to a temporary filterMovies array
    componentDidMount() {
        this.setState({
            filterMovies: this.state.movies
        });
    }
    render() {
        const renderAll = this.state.filterMovies.map((filterMovies) => {
            return (
                <div style={{ display:"inline-block", margin:15}}>
                    <br/>
                    <div className={"card"} style={{width: '18rem'}}>
                        <div className={"card-body"}>
                            <div className={"card-title"}><b>{filterMovies.title}</b></div>
                            <div className={"card-subtitle"}><b>{filterMovies.year}</b></div>
                            <div className={"card-text"}>{filterMovies.genre}</div>
                        </div>
                    </div>
                </div>
            )})
        return (
            <div className={"container mt-5"}>
                <div>
                    <button className={"btn btn-primary mr-2"}
                            onClick={this.handleOnClick}
                            value={"All"}
                    >
                        All
                    </button>
                    {genres.map((genre) => {
                        return (
                            <button
                                className={"btn btn-primary mr-2"}
                                value={genre}
                                onClick={this.handleOnClick}
                            >
                                {genre}
                            </button>
                        );
                    })}
                    <div>{renderAll}</div>
                </div>
            </div>
        )
    };
}
export default Movies;
