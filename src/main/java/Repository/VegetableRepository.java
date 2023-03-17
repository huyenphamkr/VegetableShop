package Repository;

import Entities.Vegetable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Ngoc Huyen
 */
@Repository
public interface VegetableRepository extends CrudRepository<Vegetable, Integer> {

    @Query(value = "select * from vegetable v, category c where "
            + "c.CategoryID = v.CategoryID", nativeQuery = true)
    Iterable<Vegetable> getVegetables();

    @Query(value = "select * from vegetable v, category c where "
            + "v.CategoryID = ?1 and c.CategoryID = v.CategoryID", nativeQuery = true)
    Iterable<Vegetable> getVegetablesByCategory(String id);

    @Query(value = "select * from vegetable v, category c where c.CategoryID = v.CategoryID "
            + "and v.vegetable_name LIKE %?1%", nativeQuery = true)
    Iterable<Vegetable> getVegetableByNameforSearching(String name);

    @Query(value = "select * from vegetable v, category c where  "
            + "c.CategoryID = v.CategoryID and VegetableID = ?1", nativeQuery = true)
    Vegetable getVegetableByID(String id);
}
