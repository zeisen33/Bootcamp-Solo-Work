import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";
import { fetchOnePokemonsItems, deleteItem } from "../store/items";

const PokemonItems = ({ pokemon, setEditItemId }) => {
  const dispatch = useDispatch();
  const items = useSelector((state) => {
    if (!pokemon.items) return null;
    return pokemon.items.map(itemId => state.items[itemId]);
  });

  useEffect(() => {
    dispatch(fetchOnePokemonsItems(pokemon.id))
  },[pokemon.id])

  if (!items) {
    return null;
  }

  const handleDelete = (e, item) => {
    // debugger
    e.preventDefault();
    dispatch(deleteItem(item, pokemon.id))
  }

  return items.map((item) => (
    <tr key={item.id}>
      <td>
        <img
          className="item-image"
          alt={item.imageUrl}
          src={`${item.imageUrl}`}
        />
      </td>
      <td>{item.name}</td>
      <td className="centered">{item.happiness}</td>
      <td className="centered">${item.price}</td>
      {pokemon.captured && (
        <td className="centered">
          <button onClick={() => setEditItemId(item.id)}>
            Edit
          </button>
        </td>
      )}
      {pokemon.captured && (
        <td className="centered">
          <button onClick={(e) => handleDelete(e, item)}>
            Delete
          </button>
        </td>
        
      )}
    </tr>
  ));
};

export default PokemonItems;