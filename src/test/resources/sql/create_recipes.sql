-- Insert Recipe 1 along with its first step
WITH r_ids AS (
  INSERT INTO cookbook.recipe (name,servings,text_intro,difficulty,prep_time_m,text_outro)
  VALUES
    ( -- RECIPE 1
        'Recipe 1',
        4,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget ullamcorper enim. Nulla pharetra neque arcu, vitae sagittis augue auctor non. Nulla bibendum risus eget diam bibendum maximus.',
        'medium',
        20,
        'Vestibulum lectus nisl, convallis placerat massa at, lacinia vestibulum mi. Mauris consectetur ipsum eu lobortis feugiat.'
    )
  RETURNING id
)
INSERT INTO cookbook.step (recipe_id, index, text, picture_path)
SELECT r_ids.id, 1, 'Sed non lectus eget ex ullamcorper tristique ac sed massa.', 'path/to/step/picture1'
FROM r_ids;

-- Insert other steps for Recipe 1
INSERT INTO cookbook.step (recipe_id, index, text, picture_path)
SELECT r.id, 2, 'Duis sit amet aliquam urna, euismod ultricies velit.', null
FROM (SELECT id FROM cookbook.recipe WHERE name = 'Recipe 1') AS r;

INSERT INTO cookbook.step (recipe_id, index, text, picture_path)
SELECT r.id, 3, 'Maecenas iaculis ex quis est dictum sodales.', 'path/to/step/picture3'
FROM (SELECT id FROM cookbook.recipe WHERE name = 'Recipe 1') AS r;

INSERT INTO cookbook.step (recipe_id, index, text, picture_path)
SELECT r.id, 4, 'Et voila.', null
FROM (SELECT id FROM cookbook.recipe WHERE name = 'Recipe 1') AS r;

-- Insert ingredients
INSERT INTO cookbook.ingredient (name)
VALUES ('Chicken'), ('Salt'), ('Eggs'), ('Coconut milk'), ('Olive oil'), ('Vegetable stock');

-- Add ingredients to Recipe 1
INSERT INTO cookbook.recipe_ingredient (recipe_id, ingredient_id, index, quantity, unit)
SELECT ri.rid, ri.iid, 1, '1', 'tsp'
FROM (SELECT r.id AS rid, i.id AS iid
      FROM cookbook.recipe AS r, cookbook.ingredient AS i
      WHERE r.name = 'Recipe 1' AND i.name = 'Salt') AS ri;

INSERT INTO cookbook.recipe_ingredient (recipe_id, ingredient_id, index, quantity, unit)
SELECT ri.rid, ri.iid, 2, '800', 'ml'
FROM (SELECT r.id AS rid, i.id AS iid
      FROM cookbook.recipe AS r, cookbook.ingredient AS i
      WHERE r.name = 'Recipe 1' AND i.name = 'Coconut milk') AS ri;

-- Insert more recipes (no steps, no ingredients)
INSERT INTO cookbook.recipe (name,servings,text_intro,difficulty,prep_time_m,text_outro)
VALUES
  ( -- RECIPE 2
      'Another fantastic recipe',
      2,
      null,
      'easy',
      10,
      'Nulla congue quis enim at efficitur. Vivamus tincidunt purus sit amet lacus imperdiet, eget maximus diam auctor.'
  ),
  ( -- RECIPE 3
      'A disgusting soup',
      6,
      'This is horrible.',
      'hard',
      80,
      'Please do not do it.'
  );