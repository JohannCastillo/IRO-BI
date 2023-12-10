package classes

type Diagnostico struct {
	IdAtencion       int64
	Observaciones    string
	LejosODCil       float64
	LejosODEsf       float64
	LejosODEje       float64
	LejosOIEsf       float64
	LejosOICil       float64
	LejosOIEje       float64
	CercaODEsf       float64
	CercaODCil       float64
	CercaODEje       float64
	CercaOIEsf       float64
	CercaOICil       float64
	CercaOIEje       float64
	AgudezaVisual    float64
	Tonometria       float64
	Refraccion       float64
	Campimetria      float64
	CurvaturaCorneal float64
	MedicionLagrima  float64
	Paquimetria      float64
	OCT              float64
}
