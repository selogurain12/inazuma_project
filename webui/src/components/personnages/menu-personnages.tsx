import { Box, Button, IconButton, Drawer, List, ListItem } from "@mui/material";
import MenuIcon from '@mui/icons-material/Menu';
import { useState, KeyboardEvent, MouseEvent } from "react";
import { Link } from "react-router-dom";

export function MenuPersonnage() {
  const [drawerOpen, setDrawerOpen] = useState(false);

  const toggleDrawer = (open: boolean) => (event: KeyboardEvent | MouseEvent) => {
    if (
      event.type === 'keydown' &&
      ((event as KeyboardEvent).key === 'Tab' || (event as KeyboardEvent).key === 'Shift')
    ) {
      return;
    }
    setDrawerOpen(open);
  };

  const drawerContent = (
    <Box
      sx={{ width: 280 }}
      role="presentation"
      onClick={toggleDrawer(false)}
      onKeyDown={toggleDrawer(false)}
    >
      <List>
      <ListItem>
          <Link to={'/'}>
            <Button color="inherit">Home</Button>
          </Link>
        </ListItem>
        <ListItem>
          <Link to={'/personnages/createPersonnage'}>
            <Button color="inherit">Créer un personnage</Button>
          </Link>
        </ListItem>
        <ListItem>
          <Link to={'/personnages/listPersonnages'}>
            <Button color="inherit">Voir tous les personnages</Button>
          </Link>
        </ListItem>
      </List>
    </Box>
  );

  return (
    <Box>
      <IconButton
        edge="start"
        color="inherit"
        aria-label="menu"
        onClick={toggleDrawer(true)}
      >
        <MenuIcon />
      </IconButton>
      <Drawer
        anchor="left"
        open={drawerOpen}
        onClose={toggleDrawer(false)}
      >
        {drawerContent}
      </Drawer>
    </Box>
  );
}
