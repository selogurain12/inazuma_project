import { Box, Typography } from '@mui/material'
import ButtonSelect from './home-page/button-select'
import '../css/output.css'

function App() {
  return (
    <Box sx={{height: "89vh"}}>
     <Typography variant="h2" gutterBottom sx={{justifyContent: "center", display: "flex"}}>
        INAZUMA
      </Typography>
      <Box sx={{
        width: "100%",
        height: "100%"
      }}>
        <ButtonSelect />
      </Box>
    </Box>
  )
}

export default App
